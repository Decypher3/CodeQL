/**
 * Provides public classes for MyBatis SQL injection detection.
 */

import java
import semmle.code.xml.MyBatisMapperXML
import semmle.code.java.dataflow.FlowSources
import semmle.code.java.frameworks.MyBatis
import semmle.code.java.frameworks.Properties

private predicate propertiesKey(DataFlow::Node prop, string key) {
  exists(MethodAccess m |
    m.getMethod() instanceof PropertiesSetPropertyMethod and
    key = m.getArgument(0).(CompileTimeConstantExpr).getStringValue() and
    prop.asExpr() = m.getQualifier()
  )
}

/** A data flow configuration tracing flow from ibatis obtaining the variable configuration object to setting the value of the variable. */
private class PropertiesFlowConfig extends DataFlow2::Configuration {
  PropertiesFlowConfig() { this = "PropertiesFlowConfig" }

  override predicate isSource(DataFlow::Node src) {
    exists(MethodAccess ma | ma.getMethod() instanceof IbatisConfigurationGetVariablesMethod |
      src.asExpr() = ma
    )
  }

  override predicate isSink(DataFlow::Node sink) { propertiesKey(sink, _) }
}

/** Get the key value of Mybatis Configuration Variable. */
string getAMybatisConfigurationVariableKey() {
  exists(PropertiesFlowConfig conf, DataFlow::Node n |
    propertiesKey(n, result) and
    conf.hasFlowTo(n)
  )
}

/** A reference type that extends a parameterization of `java.util.List`. */
class ListType extends RefType {
  ListType() {
    this.getSourceDeclaration().getASourceSupertype*().hasQualifiedName("java.util", "List")
  }
}

/** Holds if the specified method uses MyBatis Mapper XMLElement. */
predicate myBatisMapperXMLElementFromMethod(Method method, MyBatisMapperXMLElement mmxx) {
  exists(MyBatisMapperSqlOperation mbmxe | mbmxe.getMapperMethod() = method |
    mbmxe.getAChild*() = mmxx
    or
    exists(MyBatisMapperSql mbms |
      mbmxe.getInclude().getRefid() = mbms.getId() and
      mbms.getAChild*() = mmxx
    )
  )
}

/** Holds if the specified method uses Ibatis Sql Operation Annotation. */
predicate myBatisSqlOperationAnnotationFromMethod(Method method, IbatisSqlOperationAnnotation isoa) {
  exists(MyBatisSqlOperationAnnotationMethod msoam |
    msoam = method and
    msoam.getAnAnnotation() = isoa
  )
}

/** Get the #{...} or ${...} parameters in the Mybatis mapper xml file. */
string getAMybatisXmlSetValue(XMLElement xmle) {
  result = xmle.getTextValue().regexpFind("(#|\\$)\\{[^\\}]*\\}", _, _)
}

/** Get the #{...} or ${...} parameters in the Mybatis sql operation annotation value. */
string getAMybatisAnnotationSqlValue(IbatisSqlOperationAnnotation isoa) {
  result = isoa.getSqlValue().regexpFind("(#|\\$)\\{[^\\}]*\\}", _, _)
}

/** Holds if it is SQL injection of MyBatis xml or MyBatis annotation. */
bindingset[setValue]
predicate isMybatisXmlOrAnnotationSqlInjection(
  //DataFlow::Node node, MyBatisMapperXMLElement xmle, IbatisSqlOperationAnnotation isoa
  DataFlow::Node node, MethodAccess ma, string setValue, MyBatisMapperXMLElement mmxe
) {
  not setValue.regexpMatch("\\$\\{" + getAMybatisConfigurationVariableKey() + "\\}") and
  (
    // The method parameters use `@Param` annotation. Due to improper use of this parameter, SQL injection vulnerabilities are caused.
    // e.g.
    //
    // ```java
    //    @Select(select id,name from test order by ${orderby,jdbcType=VARCHAR})
    //    void test(@Param("orderby") String name);
    // ```
    exists(int i, Annotation annotation |
      setValue
          .matches("${" + annotation.getValue("value").(CompileTimeConstantExpr).getStringValue() +
              "%}") and
      annotation.getType() instanceof TypeParam and
      ma.getArgument(i) = node.asExpr()
    )
    or
    // MyBatis default parameter sql injection vulnerabilities.the default parameter form of the method is arg[0...n] or param[1...n].
    // e.g.
    //
    // ```java
    //    @Select(select id,name from test order by ${arg0,jdbcType=VARCHAR})
    //    void test(String name);
    // ```
    exists(int i |
      not ma.getMethod().getParameter(i).getAnAnnotation().getType() instanceof TypeParam and
      (
        setValue.matches("${param" + (i + 1) + "%}")
        or
        setValue.matches("${arg" + i + "%}")
      ) and
      ma.getArgument(i) = node.asExpr()
    )
    or
    // SQL injection vulnerability caused by improper use of MyBatis instance class fields.
    // e.g.
    //
    // ```java
    //    @Select(select id,name from test order by ${name,jdbcType=VARCHAR})
    //    void test(Test test);
    // ```
    exists(int i, RefType t |
      not ma.getMethod().getParameter(i).getAnAnnotation().getType() instanceof TypeParam and
      ma.getMethod().getParameterType(i).getName() = t.getName() and
      setValue.matches("${" + t.getAField().getName() + "%}") and
      ma.getArgument(i) = node.asExpr()
    )
    or
    // The parameter type of the MyBatis method parameter is Map or List or Array.
    // SQL injection vulnerability caused by improper use of this parameter.
    // e.g.
    //
    // ```java
    //    @Select(select id,name from test where name like '%${value}%')
    //    Test test(Map map);
    // ```
    exists(int i, MyBatisMapperForeach mbmf |
      mbmf = mmxe and
      not ma.getMethod().getParameter(i).getAnAnnotation().getType() instanceof TypeParam and
      (
        ma.getMethod().getParameterType(i) instanceof MapType or
        ma.getMethod().getParameterType(i) instanceof ListType or
        ma.getMethod().getParameterType(i) instanceof Array
      ) and
      setValue.matches("${%}") and
      ma.getArgument(i) = node.asExpr()
    )
    or
    // This method has only one parameter and the parameter is not annotated with `@Param`. The parameter can be named arbitrarily in the SQL statement.
    // If the number of method variables is greater than one, they cannot be named arbitrarily.
    // Improper use of this parameter has a SQL injection vulnerability.
    // e.g.
    //
    // ```java
    //    @Select(select id,name from test where name like '%${value}%')
    //    Test test(String name);
    // ```
    exists(int i | i = 1 |
      ma.getMethod().getNumberOfParameters() = i and
      not ma.getMethod().getAParameter().getAnAnnotation().getType() instanceof TypeParam and
      setValue.matches("${%}") and
      ma.getAnArgument() = node.asExpr()
    )
  )
}

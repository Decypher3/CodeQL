// generated by codegen/codegen.py
import codeql.swift.elements.Element
import codeql.swift.elements.File

class LocationBase extends @location, Element {
  override string getPrimaryQlClass() { result = "Location" }

  File getFile() {
    exists(File x |
      locations(this, x, _, _, _, _) and
      result = x.resolve()
    )
  }

  int getStartLine() { locations(this, _, result, _, _, _) }

  int getStartColumn() { locations(this, _, _, result, _, _) }

  int getEndLine() { locations(this, _, _, _, result, _) }

  int getEndColumn() { locations(this, _, _, _, _, result) }
}

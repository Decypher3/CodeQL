using System.IO; // lgtm[cs/similar-file]
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Semmle.Extraction.Kinds;

namespace Semmle.Extraction.CSharp.Entities.Statements
{
    internal class Unchecked : Statement<CheckedStatementSyntax>
    {
        private Unchecked(Context cx, CheckedStatementSyntax stmt, IStatementParentEntity parent, int child)
            : base(cx, stmt, StmtKind.UNCHECKED, parent, child) { }

        public static Unchecked Create(Context cx, CheckedStatementSyntax node, IStatementParentEntity parent, int child)
        {
            var ret = new Unchecked(cx, node, parent, child);
            ret.TryPopulate();
            return ret;
        }

        protected override void PopulateStatement(TextWriter trapFile)
        {
            Statement.Create(Context, Stmt.Block, this, 0);
        }
    }
}

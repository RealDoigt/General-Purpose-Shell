module expressions.grouping;
import expressions;
import token_class;

class Grouping : Expression
{
    Expression expr;

    this(Expression expr)
    {
        this.expr = expr;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitGroupingExpression(this);
    }
}

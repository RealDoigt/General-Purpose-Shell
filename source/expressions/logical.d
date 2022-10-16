module expressions.logical;
import expressions.expression;
import token_class;
import visitor;

class Logical : Expression
{
    Token operator;
    Expression left, right;

    this(Expression left, Token operator, Expression right)
    {
        this.left = left;
        this.right = right;
        this.operator = operator;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitLogicalExpression(this);
    }
}

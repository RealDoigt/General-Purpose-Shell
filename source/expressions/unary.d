module expressions.unary;
import expressions;
import token_class;

class Unary : Expression
{
    Token operator;
    Expression right;

    this(Token operator, Expression right)
    {
        this.right = right;
        this.operator = operator;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitUnaryExpression(this);
    }
}

module expressions.unary;
import expressions.expression;
import token_class;
import visitor;

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

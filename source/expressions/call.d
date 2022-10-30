module expressions.call;
import expressions;
import token_class;

class Call : Expression
{
    Token paren;
    Expression callee;
    Expression[] arguments;

    this(Expression callee, Token paren, Expression[] arguments)
    {
        this.paren = paren;
        this.callee = callee;
        this.arguments = arguments;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitCallExpression(this);
    }
}

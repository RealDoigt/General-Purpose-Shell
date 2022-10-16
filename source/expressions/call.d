module expressions.call;
import expressions.expression;
import token_class;

class Call : Expression
{
    Token paren;
    Expression callee;
    Expression[] arguments;

    this(Expression callee, Token paren, Expression[] arguments)
    {
        this.arguments = arguments;
        this.callee = callee;
        this.paren = paren;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitCallExpression(this);
    }
}

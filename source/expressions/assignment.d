module expressions.assignment;
import expressions.expression;
import token_class;

class Assign : Expression
{
    Token name;
    Expression value;

    this(Token name, Expression value)
    {
        this.name = name;
        this.value = value;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitAssignExpression(this);
    }
}

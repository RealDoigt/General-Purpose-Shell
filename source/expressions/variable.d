module expressions.variable;
import expressions;
import token_class;

class Variable : Expression
{
    Token name;

    this(Token name)
    {
        this.name = name;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitVariableExpression(this);
    }
}

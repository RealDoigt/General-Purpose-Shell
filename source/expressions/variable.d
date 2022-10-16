module expressions.variable;
import expressions.expression;
import token_class;
import visitor;

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

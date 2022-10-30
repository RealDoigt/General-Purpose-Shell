module expressions.literal;
import expressions;
import variant_type;
import token_class;

class Literal : Expression
{
    Variant value;

    this(Variant value)
    {
        this.value = value;
    }

    override T accept(T)(IVisitor!T visitor)
    {
        return visitor.visitLiteralExpression(this);
    }
}

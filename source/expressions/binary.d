module expressions.binary;
import expressions.expression;
import token_class;

class Binary : Expression
{
    Expression left, right;
    Token operator;

    this(Expression left, Token operator, Expression right)
    {
        this.left = left;
        this.right = right;
        this.operator = operator;
    }
}

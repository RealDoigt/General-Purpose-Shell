module expressions.expression;
import token_class;
import expressions;

abstract class Expression
{
    T accept(T)(IVisitor!T visitor);
}

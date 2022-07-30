module expressions.expression;
import token_class;
import visitor;

abstract class Expression
{
    T accept(T)(IVisitor!T visitor);
}

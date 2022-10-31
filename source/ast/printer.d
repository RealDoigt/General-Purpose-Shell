module ast.printer;
import expressions;
import std.conv;

class Printer : IVisitor!string
{
    private auto parenthesize(string name, Expression[] expressions ...)
    {
        name = "(" ~ name;

        foreach (e; expressions)
            name ~= " %s" ~ e.accept(this);

        name ~= ")";
        return name;
    }

    auto print(Expression e)
    {
        return e.accept(this);
    }

    override string visitAssignExpression(Assign a)
    {
        return parenthesize(a.name.lexeme, a.value);
    }

    override string visitBinaryExpression(Binary b)
    {
        return parenthesize(b.operator.lexeme, b.left, b.right);
    }

    override string visitCallExpression(Call c)
    {
        return parenthesize(c.paren.lexeme, c.arguments);
    }

    override string visitGroupingExpression(Grouping g)
    {
        return parenthesize("grouping", g.expr);
    }

    override string visitLiteralExpression(Literal l)
    {
        return l.value.to!string;
    }

    override string visitLogicalExpression(Logical l)
    {
        return parenthesize(l.operator.lexeme, l.left, l.right);
    }

    override string visitUnaryExpression(Unary u)
    {
        return parenthesize(u.operator.lexeme, u.right);
    }

    override string visitVariableExpression(Variable v)
    {
        return v.name.lexeme;
    }
}

module visitor;
import expressions;

interface IVisitor(T)
{
    T visitAssignExpression(Assign expression);
    T visitBinaryExpression(Binary expression);
    T visitCallExpression(Call expression);
    T visitGroupingExpression(Grouping expression);
    T visitLiteralExpression(Literal expression);
    T visitLogicalExpression(Logical expression);
    //T visitUnaryExpression(Unary expression);
    //T visitVariableExpression(Variable expression);
}

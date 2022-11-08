module parser;
import token_class;
import expressions;

class Parser
{
    private
    {
        Token[] tokens;
        int current;

        Expression expression()
        {
            return equality;
        }
    }

    this(Token[] tokens)
    {
        this.tokens = tokens;
    }
}

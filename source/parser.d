module parser;
import token_class;

class Parser
{
    private
    {
        Token[] tokens;
        int current;
    }

    this(Token[] tokens)
    {
        this.tokens = tokens;
    }
}

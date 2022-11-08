module parser;
import token_class;
import expressions;

class Parser
{
    private
    {
        Token[] tokens;
        int current;

        Expression equality()
        {
            auto e = comparison;

            while (match(notEqual, equal))
            {
                auto op = previous,
                     right = comparison;

                e = Binary(e, op, right);
            }

            return e;
        }

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

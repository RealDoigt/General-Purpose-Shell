module parser;
import token_type;
import token_class;
import expressions;

class Parser
{
    private
    {
        Token[] tokens;
        int current;

        auto peek()
        {
            return tokens[current];
        }

        bool isAtEnd()
        {
            return peek.type = TokenType.endOfFile;
        }

        auto advance()
        {
            if (!isAtEnd) ++current;
            return previous;
        }

        bool check(TokenType type)
        {
            if (isAtEnd) return false;
            return peek.type == type;
        }

        bool match(TokenType types ...)
        {
            foreach (t; types)
                if (check(type))
                {
                    advance;
                    return true;
                }

            return false;
        }

        auto equality()
        {
            auto e = comparison;

            while (match(TokenType.notEqual, TokenType.equal))
            {
                auto op = previous,
                     right = comparison;

                e = Binary(e, op, right);
            }

            return e;
        }

        auto expression()
        {
            return equality;
        }
    }

    this(Token[] tokens)
    {
        this.tokens = tokens;
    }
}

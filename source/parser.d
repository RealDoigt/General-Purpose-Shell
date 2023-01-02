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

        auto previous()
        {
            return tokens[current - 1];
        }

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
            // e = expression 
            auto e = comparison;

            while (match(TokenType.notEqual, TokenType.equal))
            {
                auto op = previous,
                     right = comparison;

                e = new Binary(e, op, right);
            }

            return e;
        }

        auto expression()
        {
            return equality;
        }
        
        auto comparison()
        {
            auto e = term;
            
            while 
            (
                match
                (
                    TokenType.greaterThan, 
                    TokenType.lowerThan, 
                    TokenType.greaterThanEqual, 
                    TokenType.lowerThanEqual
                )
            )
            {
                auto op = previous,
                     right = term;
                     
                e = new Binary(e, op, right);
            }
            
            return e;
        }
        
        auto term()
        {
            e = factor;
            
            while (match(TokenType.minus, TokenType.plus))
            {
                auto op = previous,
                     right = factor;
                     
                e = new Binary(e, op, right);
            }
            
            return e;
        }
        
        auto factor()
        {
            e = unary;
            
            while (match(TokenType.divide, TokenType.multiply))
            {
                auto op = previous,
                     right = unary;
                     
                e = new Binary(e, op, right);
            }
            
            return e;
        }
        
        auto unary() 
        {
            if (match(TokenType.not, TokenType.minus)) 
            {
                auto op = previous,
                     right = unary;
                     
                return new Unary(op, right);
            }

            return primary();
        }

    }

    this(Token[] tokens)
    {
        this.tokens = tokens;
    }
}

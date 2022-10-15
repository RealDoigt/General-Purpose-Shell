module token_class;
import token_type;
import std.string;
import std.variant;

class Token
{
    private
    {
        TokenType _type;
        string _lexeme;
        string _litteral;
        int _line;
    }

    this(TokenType type, string lexeme, string litteral, int line)
    {
        _type = type;
        _line = line;
        _lexeme = lexeme;
        _litteral = litteral;
    }

    auto type()
    {
        return _type;
    }

    auto lexeme()
    {
        return _lexeme;
    }

    auto litteral()
    {
        return _litteral;
    }

    int line()
    {
        return _line;
    }

    override string toString()
    {
        return "%s %s %s".format(type, lexeme, litteral);
    }
}

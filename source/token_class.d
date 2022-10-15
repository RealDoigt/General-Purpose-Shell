module token_class;
import token_type;
import box;
import std.string;
import std.variant;

class Token
{
    private
    {
        TokenType _type;
        string _lexeme;
        BoxedValue _litteral;
        int _line;
    }

    this(TokenType type, string lexeme, BoxedValue litteral, int line)
    {
        _type = type;
        _line = line;
        _lexeme = lexeme;
        _litteral = litteral;
    }

    TokenType type()
    {
        return _type;
    }

    string lexeme()
    {
        return _lexeme;
    }

    BoxedValue litteral()
    {
        return _litteral;
    }

    int line()
    {
        return _line;
    }

    override string toString()
    {
        return "%s %s %s".format(type, lexeme, litteral !is null ? litteral.toString : "");
    }
}

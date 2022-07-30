module token_class;
import token_type;
import box;
import std.string;
import std.variant;

class Token
{
    private
    {
        TokenType type;
        string lexeme;
        BoxedValue litteral;
        int line;
    }

    this(TokenType type, string lexeme, BoxedValue litteral, int line)
    {
        this.type = type;
        this.line = line;
        this.lexeme = lexeme;
        this.litteral = litteral;
    }

    TokenType Type()
    {
        return type;
    }

    string Lexeme()
    {
        return Lexeme;
    }

    BoxedValue Litteral()
    {
        return litteral;
    }

    int Line()
    {
        return line;
    }

    override string toString()
    {
        return "%s %s %s".format(type, lexeme, litteral !is null ? litteral.toString : "");
    }
}

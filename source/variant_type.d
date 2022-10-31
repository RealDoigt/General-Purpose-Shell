module variant_type;
import std.sumtype;

alias Variant = SumType!
(
    float,
    double,
    real,
    ubyte,
    short,
    ushort,
    int,
    uint,
    long,
    ulong,
    char,
    wchar,
    dchar,
    string,
    wstring,
    dstring,
    float[],
    double[],
    real[],
    ubyte[],
    short[],
    ushort[],
    int[],
    uint[],
    long[],
    ulong[],
    char[],
    wchar[],
    dchar[],
    string[],
    wstring[],
    dstring[]
);

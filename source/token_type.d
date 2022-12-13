module token_type;

enum TokenType
{
    // single-character tokens
    leftParenthesis,  // (
    rightParenthesis, // )
    leftBrace,        // {
    rightBrace,       // }
    leftBracket,      // [
    rightBracket,     // ]
    comma,            // ,
    semiColon,        // ;
    plus,             // +
    minus,            // -
    divide,           // /
    multiply,         // *
    bitwiseOr,        // |
    bitwiseAnd,       // &
    not,              // !
    lowerThan,        // <
    greaterThan,      // >
    assign,           // =
    modulo,           // %
    ternary,          // ?
    concatenate,      // ~

    // dual-character tokens
    leftShift,          // <<
    rightShift,         // >>
    plusAssign,         // +=
    minusAssign,        // -=
    multiplyAssign,     // *=
    divideAssign,       // /=
    orAssign,           // |=
    andAssign,          // &=
    equal,              // ==
    castEqual,          // ?=
    notEqual,           // !=
    lowerThanEqual,     // <=
    greaterThanEqual,   // >=
    logicalOr,          // ||
    logicalAnd,         // &&
    streamfrom,         // <>
    returnStatement,    // =>
    increment,          // ++
    decrement,          // --
    moduloAssign,       // %=
    concatenateAssign,  // ~=
    castType,           // ?!
    castPlus,           // ?+
    castMinus,          // ?-
    castMultiply,       // ?*
    castDivide,         // ?/
    castOr,             // ?|
    castAnd,            // ?&
    castModulo,         // ?%
    castConcatenate,    // ?~

    // three-character tokens
    assignLeftShift,    // <<=
    assignRightShift,   // >>=
    castLeftShift,      // ?<<
    castRightShift,     // ?>>

    // literals
    identifier,
    decimalNumber,
    integerNumber,
    label,

    // keywords
    error,         // err
    reference,     // ref
    notGlobal,     // static
    constant,      // cst
    use,           // use
    integer,       // int  signed 32 bit   big int  signed 64 bit    smol int  signed 16 bit
    unsigned,      // unt  unsigned 32 bit big unt  unsigned 64 bit  smol unt  unsigned 16 bit
    decimal,       // flt  64 bit          big flt  largest possible smol flt  32 bit
    boolean,       // bin  8 bit           big bin  invalid          smol bin  invalid
    variant,       // var  anything        big var  invalid          smol var  8 bit unt
    variantArray,  // arr  var[]           big arr  invalid          smol arr  8 bit unt[]
    variantDict,   // map  var[var]        big map  invalid          smol map  8 bit unt[var]
    variantFunct,  // fun  var()           big fun  invalid          smol fun  8 bit unt()
    stringType,    // str  utf-8 string    big str  utf-16 string    smol str  ascii string
    characterType, // chr  utf-8 char      big chr  utf-16 char      smol chr  ascii char
    bigModifier,   // big
    smolModifier,  // smol
    ifCond,        // if
    unless,        // un
    elseIf,        // elif
    elseUnless,    // elun
    elseCond,      // else
    switchCond,    // switch
    whileLoop,     // while
    until,         // til
    forever,       // loop
    forEach,       // each
    forLoop,       // for
    caseCond,      // case
    brick,         // brk   brk <n>   bricks to the nth parent loop   big brk  stops the whole loop   smol brk  continue
    tru,           // true
    notTru,        // false
    print,         // out
    read,          // in
    terminal,      // term
    popup,         // pop
    graphical,     // gui
    webServer,     // cgi
    isType,        // is
    voidType,      // void

    // shell commands
    changeDirectory,      // cd
    list,                 // ls
    manual,               // man
    move,                 // mv
    remove,               // rm
    copy,                 // cp
    makeChangeDirectory,  // mcd
    createFile,           // mk
    createDirectory,      // mkd
    changeOwner,          // cho
    changeGroup,          // chg
    changeRights,         // chm
    edit,                 // ed
    cat,                  // cat
    searchCat,            // sat
    currentDirectory,     // wd
    netInterface,         // ifc
    netStat,              // net
    lookup,               // nsl
    uptime,               // upt
    broadcast,            // bro
    canUseWrite,          // mes
    rename,               // rn
    cpuProcesses,         // cpu
    whoUptime,            // wu
    head,                 // hd
    tail,                 // tl
    sort,                 // srt
    charCount,            // cc
    wordCount,            // wc
    diskSpace,            // df
    diskUsage,            // du
    locate,               // lct
    download,             // dl
    extract,              // ext
    archive,              // arc

    // others
    endOfFile
}

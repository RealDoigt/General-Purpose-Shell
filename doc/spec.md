# General Purpose Shell Language Specification

## Introduction

General Purpose Shell (GPS) is a shell language intended for non-interactive shell scripting; meaning it is running neither as nor in an interactive environnment like a terminal or a REPL as Unix shells and other shell projects usually do. It is also intended to have features which allow it to be used as something with which one can quickly whip out a prototype for a project idea or a toy script, so it has some crossover into more traditional programming language territory.

### Forewarning

This document merely states what a working implementation of the language should have. It doesn't state the reasons behind any of the decisions nor the goals of the project. If you are more interested in that, see the goals.md document.

At this point in time, the language is still very much a work in progress and thus, the details written here may not be final. As issues encountered during development and testing arise, things may be added or removed from the language.

Again, as is written above, the language is still very much a work in progress. This document states what an implementation _should_ have. It does _not_ reflect the current state of the language interpreter written by Doigt.

This is not a tutorial nor a guide to learn this language. Nothing prevents anyone to use the language specification for this purpose, but they should keep in mind that it is not its intended purpose.

## Literals

There are three types of literals: binary literals, numeric literals and string literals.

### Boolean

A boolean literal is defined as being one of two valid keywords; `true` or `false`.

### Numeric

A numeric literal is defined as any sequence of arab numbers (0 to 9) which represent a number. The number sequence may optionally contain a dot and may begin or end with a dot. A valid numeric literal may solely have a dot and nothing else, however there may not be more than one dot.

Examples of valid numeric literals:
`02143423`
`53`
`4`
`0.1`
`.6777`
`99.`
`.`
`1111111111111`

### String

A string literal is defined as any character sequence enclosed within a pair of single quotes (`'`) which isn't an unescaped single quote.

Examples of valid string literals:
`'a'`
`'GPS'`
`'hguhdsjfgajthruaghuasghkflsvhkjabiertgfiydfgbdshafvbdhklasfgbryaf'`
`'\'hello\''`

##### Escape sequences

Escape sequences are special character sequences which begin with the backslash character (`\`). They are used for characters that are not practical to type on a keyboard or characters which have a special functionality:

`\t`
`\r`
`\n`
`\0`
`\'`
`\\`
`\b`
`\v`
`\a`
`\f`

If an implementer finds out that a desired host platform doesn't support well other characters which are normally well supported on modern platforms, the implementer should add more escape sequences to accomodate the host platform.

Ideally, an implementation which encounters an unsupported escape sequence could simply remove the backslash character from the string constant and not do anything else with it.

## Constants

GPS lets you define integer, decimal, string and character constants. Immutable variables are defined further down the document and are not the subject of this section.

### Integer

An integer constant is defined as any numeric literal which doesn't have a dot.

### Decimal

A decimal constant is defined as any numeric literal which has a dot.

### String

A string constant is defined as any string literal which is comprised of more than one character if we remove the single quotes and any escape character.

### Character

A character constant is defined as any string literal which is comprised of only one character if we remove the single quotes and any escape character.

## Types

The type system in this language is both static and dynamic. `var` is the keyword reserved for dynamically typed variables called variants. For the keywords of other types, see the section on reserved keywords.

All constants have a default type; integer constants are signed and 32-bit, string/character constants are utf-8 and decimal constants are of the 64-bit binary format; there should be no true decimal floating point type in GPS.

## Variables

A variable has an identifier, which can be any sequence of alphanumeric characters or an underscore. However, one cannot be allowed to use a reserved keyword to name a variable and variable identifiers don't start with a number. When declaring a variable, it needs type information, which comes before the identifier. It's also the only time when it is legal to add modifiers.

Variables may have more than one modifier. The order of the modifiers is unimportant, but they need to be before the type.

### Size modifiers

GPS comes with keywords (`big` and `smol`) which alter the byte size of a variable. They are used before the type like in this variable declaration example: `big int my_integer = 1;`. See the section on reserved keywords for more information about what each combo means. At the time of writing this, the only way you can find this information is by looking at the comments in `token_type.d`.

### Static

The `static` modifier makes a variable inaccessible outside of the file it was declared in.

### Constant

The constant (`cst`) modifier marks a variable as read-only. It can be assigned a value at any time, but once it has a value, its value cannot be changed and it cannot be passed by reference unless the parameter of that function is also marked as constant.

### Arrays

An array is a variable which can hold many other variables. To declare an array, simply add brackets (`[]`) after the type in the variable declaration. A value of the array can be access by typing its identifier followed by brackets enclosing a value which serves as an index. If the index is out of bounds, the script should stop executing and output a meaningful error message. While strings are not exactly identical to arrays, they operate the same way for value access:

`myArr[5] = 8;`

`if (hello[0] == 'h')`

In GPS, arrays are dynamic, meaning they don't have a fixed size. One can keep adding or removing elements as often as one likes.

#### Array value assignment

There are multiple ways to assign or add a value to an array:

* An array can be initialized by enclosing a comma-separated sequence of values within brackets (`[]`) after the assign operator (`=`) like this: `var myArr = ['hello', 1, 2.3, 'c'];`
  * The same principle can be used to make the array empty: `myArr = [];`
* By directly accessing a value by index. The array index 0 in this language: `myArr[0] = 'world';`
* By setting all values to one value: `myArr = 'world';`
* By concatenating in values of another array or value using the concat operator: `myArr = myArr ~ ['a', 'b'] ~ 'c'`
  * There's no "deconcat" operator to remove elements. See below.
* Using the repeat operator to add multiple times the same values: `myArr = [4, 5] *~ 10;`

#### Removing values

To remove a value, you have to use the `pop` keyword. There are three ways to use it to remove values:

* Writing the keyword and the array's identifier in that order; it will remove the last element of the array: `pop myArr;`
* Adding a number after the identifier which is the index of the element to remove: `pop myArr 0;`
* Adding a sequence of values enclosed in brackets after the identifier. This will remove the first instance of each of these values in the array: `pop myArr ['hello'];`

### Maps

Maps work almost exactly the same as arrays, except one can customize the type of the index, which is called a key when it refers to a map's index. Key differences in usage examples:

* Declaration (the key's type is between the brackets): `str[chr] myMap;`
* Empty map: `var myVarMap = [var];` `myMap = [chr];`
* Sequence assignment not possible.
* If a key doesn't exist, it is created: `myMap['h'] = 'Hello';`
* The concat operator cannot be used with maps.
* The repeat operator cannot be used with maps.
* The `pop` keyword needs a key to remove an element from the map: `pop myMap 'h';`

#### The Difference Between var and var[]
##### ...and var and var[var]

A variant is a type of variable which can hold any kind of value. Anything can go in there. So you can store an array in a `var`. `var[]` on the other hand is something which blurs the lines between a static type a dynamic type; it indicates an array of variants so the compiler knows that the elements inside are all variants. This is also similar for `var[var]`, which indicates a map of variants which use variants as index. Since the map is proper static type, you could have `var[str]` where the map has string keys and variant values.

## Functions

Functions are not variables. However, they bear great similarities with variables. One of the differences is  that they can also be used with the `void` type, which is a fake type not usable with true variables. `void` is used to indicate that the function returns nothing when it is called.

`int() getFour => 4;`

Functions usually require the function code to be enclosed within curly brackets (`{}`) after the assign operator. In single-line functions which return a value, the assign operator (`=`) and the curly brackets can be omitted.

A function signature is anything part of the function code which is before the the assign operator. A function body is anything after the `=`. Those are terms that should be used for related errors as well as in documentation about GPS.

### Parameters

Parameters are variables declared inside the parentheses of the function signature and which are separated by commas when there is more than one parameter. These variables hold a copy of the value that is passed to the function when it is being called. Read sections below for exceptions.

Parameters may have more than one modifier. The order of the modifiers is unimportant, but they need to be before the type.

#### Static

The `static` modifier means the parameter will not be passed as a reference to another function.

#### Constant

The constant (`cst`) modifier marks a parameter as read-only. It cannot be assigned value within the function body.

#### Reference

The reference (`ref`) modifer marks a parameter as holding the address of a variable (also known as a pointer in other languages) rather than hold a copy of its value. This means that if the parameter's value is modified, the variable used in the function call is also modified, for example:

```sh
void(ref int i) myFun = {i = 1;};

int a = 5;
myFun(a);
out a == 5; # a's value was changed to 1, it will therefore 'false' to the console!
```

The programmer must never have to explicitely dereference like in C. Dereferencing must be handled by the implementation.

## Glyphs

The language comes with many glyphs which can be used to add meaning to a program without being keywords themselves. A glyph in GPS jargon, is any character or sequence thereof which usually aren't letters of the latin alphabet. There are three types of glyphs in GPS: operators, escape sequences and other glyphs.

### Operators

Operators are glyphs which evaluate to an expression which usually returns a value.

#### Classic operators

General Purpose Shell comes with operators which seasoned programmers will easily recognise:

| Type     | Operator | Description                                                                                      | Usage    |
|----------|----------|--------------------------------------------------------------------------------------------------|----------|
|Arithmetic|+         | Returns the sum of two numbers                                                                   | a + b    |
|Arithmetic|-         | Returns the difference of two numbers                                                            | a - b    |
|Arithmetic|*         | Returns the product of two numbers                                                               | a * b    |
|Arithmetic|/         | Returns the quotient of two numbers                                                              | a / b    |
|Arithmetic|%         | Returns the remainder of the division of two integers                                            | a % b    |
|Binary    |&         | Returns the result of a bitwise AND operation between two numbers                                | a & b    |
|Binary    |\|        | Returns the result of a bitwise OR operation between two numbers                                 | a \| b   |
|Binary    |<<        | Returns the left-shifted value of an integer by a second integer                                 | a << b   |
|Binary    |>>        | Returns the right-shifted value of an integer by a second integer                                | a >> b   |
|Logical   |&&        | Returns 'true' if both expressions are true or return any number that isn't 0 (short ciruits)    | a && b   |
|Logical   |\|\|      | Returns 'true' if either expressions are true or return any number that isn't 0 (short circuits) | a \|\| b |

# General Purpose Shell Language Specification

## Introduction

General Purpose Shell (GPS) is a shell language intended for non-interactive shell scripting; meaning it is not running neither as nor in an interactive environnment like a terminal or a REPL as Unix shells and other shell projects do. It is also intended to have features which allow it to be used as something with which one can quickly whip out a prototype for a project idea or a toy script, so it has some crossover into more traditional programming language territory.

### Forewarning

This document merely states what a working implementation of the language should have. It doesn't state the reasons behind any the decisions nor the goals of the project. If you are more interested in that, see the goals.md document.

At this point in time, the language is still very much a work in progress and thus, the details written here may not be final. As issues encountered during development and testing arise, things may be added or removed from the language.

Again, as is written above, the language is still very much a work in progress. This document states what an implementation _should_ have. It does _not_ reflect the current state of the language interpreter written by Doigt.

This is not a tutorial nor a guide to learn this language. Nothing prevents you to use the language specification for this purpose, but you should keep in mind that it is not its intended purpose.

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

All constants have a default type; integer constants are signed and 32-bit, string/character constants are utf-8 and decimal constants are of the 64-bit binary format; there should be no real decimal floating point type in GPS.

## Variables

A variable has an identifier, which can be any sequence of alphanumeric characters or an underscore. However, one cannot be allowed to use a reserved keyword to name a variable and variable identifiers don't start with a number. When declaring a variable, it needs type information, which comes before the identifier. It's also the only time when it is legal to add modifiers.

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

#### The Difference Between var and var[]
##### ...and var and var[var]

A variant is a type of variable which can hold any kind of value. Anything can go in there. So you can store an array in a `var`. `var[]` on the other hand is something which blurs the lines between a static type a dynamic type; it indicates an array of variants so the compiler knows that the elements inside are all variants. This is also similar for `var[var]`, which indicates a map of variants which use variants as index. Since the map is proper static type, you could have `var[str]` where the map has string keys and variant values.

### Functions

Functions are variables, they work exactly the same as regular variables but they can also be used with the `void` type, which is a fake type not usable with other kinds of variables, to indicate that the function returns nothing when it is called. As the previous sentence suggests,

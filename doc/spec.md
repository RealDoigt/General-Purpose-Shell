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

A string literal is defined as any character sequence enclosed within a pair of single quotes (`'`) which isn't an unescaped single quote. See escape sequences later.

Examples of valid string literals:
`'a'`
`'GPS'`
`'hguhdsjfgajthruaghuasghkflsvhkjabiertgfiydfgbdshafvbdhklasfgbryaf'`
`'\'hello\'`

## Constants

GPS lets you define integer, decimal, string and character constants.

### Integer

An integer constant is defined as any numeric literal which doesn't have a dot.

### Decimal

A decimal constant is defined as any numeric literal which has a dot.

### String

A string constant is defined as any string literal which is comprised of more than one character if we remove the single quotes and any escape chara



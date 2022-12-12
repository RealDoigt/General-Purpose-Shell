# General Purpose Shell Language Specification

## Introduction

General Purpose Shell (GPS) is a shell language intended for non-interactive shell scripting; meaning it is not running neither as nor in an interactive environnment like a terminal or a REPL as Unix shells and other shell projects do. It is also intended to have features which allow it to be used as something with which one can quickly whip out a prototype for a project idea or a toy script, so it has some crossover into more traditional programming language territory.

### Forewarning
This document merely states what a working implementation of the language should have. It doesn't state the reasons behind any the decisions nor the goals of the project. If you are more interested in that, see the goals.md document.

At this point in time, the language is still very much a work in progress and thus, the details written here may not be final. As issues encountered during development and testing arise, things may be added or removed from the language.

This is not a tutorial nor a guide to learn this language. Nothing prevents you to use the language specification for this purpose, but you should remain aware that it is not its intended purpose.

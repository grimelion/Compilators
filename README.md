## Installation

`opam install ocamlfind`

After that, you should run `make` in `src` folder. This should produce `compile.byte` and `interp.byte` executables.

After all this magic, run `make` in the `runtime` directory to compile the very simple runtime library (using gcc).

On Linux, use `nasm -f elf64 FILENAME.s` to assemble the compiler's output for FILENAME. On Mac, use `nasm -f macho64 --prefix _ FILENAME.s`. Then use `gcc COMPILER_DIR/runtime/io.o FILENAME.o -o FILENAME` to link the program with the runtime library.

See the `tests` directory for some example programs.

## The source language

Keywords are `+ - * / | & << < > = || && ! := do while if then else input output true false array return function let bool int`

Identifiers are strings of letters, underscores, and digits (not starting with a digit) that are not keywords.

Numbers are sequences of digits that fit into a 64-bit signed integer.

Comments start with '//' and last until the end of the line.

All numerical operations are on signed, 2s complement 64-bit integers.

Multi-dimensional arrays are supported. Array elements are 64-bit integers.

op ::=
| `+` --- Addition
| `-` --- Subtraction
| `*` --- Multiplication
| `/` --- Division
| `|` --- Bitwise or
| `&` --- Bitwise and
| `<<` --- Left shift
| `<` --- Less than
| `>` --- Greater than
| `=` --- Equality
| `||` --- Logical or
| `&&` --- Logical and

uop ::=
| `!` --- Logical negation
| `-` --- Unary minus

indices ::=
| `[` exp `]` indices
| epsilon

args ::=
| exp
| exp `,` args

atomic_exp ::=
| identifier indices --- Variable use and array indexing
| identifier `(` args `)` --- Function call
| number --- Integer constant
| `true` --- Boolean constant
| `false` --- Boolean constant
| uop atomic_exp --- Unary operation
| `array` indices --- Array allocation
| `(` exp `)` --- Parenthesised expression

exp ::=
| atomic_exp op atomic_exp --- Binary operation
| atomic_exp

stmt ::=
| identifier indices `:=` exp
| `while` exp stmt
| `do` stmt `while` exp
| `if` exp `then` smth `else` smth
| `{` stmts `}`
| `input` identifier
| `output` identifier
| `return` identifier

stmts ::=
| epsilon
| stmt stmts

typ ::=
| `int` --- a 64-bit signed integer
| `bool` --- a boolean
| `array` number --- an n dimensional array of 64-bit signed integers

params ::=
| `(` identifier `:` type `)`
| `(` identifier `:` type `)` params

var_decs ::=
| epsilon
| `let` identifier `:` typ `=` exp var_decs

functions ::=
| epsilon
| `function` identifier params `:` type `{` var_decs stmts `}` funcs

program ::=
| var_decs functions

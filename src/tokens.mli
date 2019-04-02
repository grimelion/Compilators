
(* The language's tokens, and a simple lexer *)

type op =
  | Plus
  | Minus
  | Times
  | Div
  | Lshift
  | BitOr
  | BitAnd
  | Lt
  | Gt
  | Eq
  | And
  | Or

type uop =
  | Not

type token =
  | Num of int64
  | Ident of string
  | Op of op
  | Uop of uop
  | Lparen
  | Rparen
  | Lcurly
  | Rcurly
  | Lbrac
  | Rbrac
  | Colon
  | Comma
  | While
  | Do
  | If
  | Then
  | Else
  | Assign
  | True
  | False
  | Input
  | Output
  | Array
  | Int
  | Bool
  | Let
  | Function
  | Return

type tok_loc = (token * int)

val show_uop : uop -> string
val show_op : op -> string
val show_token : token -> string
val pp_tok_loc : Format.formatter -> tok_loc -> unit
val lex : string -> int -> int -> tok_loc list

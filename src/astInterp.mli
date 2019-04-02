
(* An interpreter for ASTs *)

(* For when the interpreter crashed, such as array bounds violations *)
exception Crash of string

(* For errors that a well-typed program can't have *)
exception TypeError

(* Values are either integers or n-dimensional arrays of integers.
   We keep multi-dimensional arrays in a single dimensional one and include a
   list of how big each dimension is.
   We represent bools as numbers: true = 1L and false = 0L *)
type val_t =
  | Vint of int64
  | Varray of int list * int64 array

val do_op : Tokens.op -> int64 -> int64 -> int64

val interp_prog : SourceAst.prog -> unit



(* The front end. It packages lexing, parsing and type checking for use by the
   interpreter and type checker both. *)

open Util

(* Parse and type check the given filename. *)
let front_end (filename : string) (debug : bool) : SourceAst.prog
  =
  if Filename.check_suffix filename ".expl" then
    try
      let input = Std.input_file filename in
      let toks = Tokens.lex input 0 1 in
      if debug then
        Format.printf "%a@\n@\n" (pp_list Tokens.pp_tok_loc) toks;
      let ast = SourceAst.parse_program toks in
      if debug then
        Format.printf "%a@\n@\n" SourceAst.pp_program ast;
      let ast2 = TypeCheck.type_prog ast in
      if debug then
        Format.printf "%a@\n@\n" SourceAst.pp_program ast2;
      ast2
    with
    | BadInput s ->
      Format.printf "%s\n" s;
      exit 1
  else
    (Format.printf "Expects filename ending in .expl\n";
     exit 1)

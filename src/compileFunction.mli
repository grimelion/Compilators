
(* Compiler for a single function *)

val compile_fun : bool -> string -> BlockStructure.Varset.t -> SourceAst.func -> SourceAst.id * X86.instruction list


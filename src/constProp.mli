

(* Do constant propagation and folding *)

open SourceAst
val prop_stmts : exp Idmap.t -> stmt list -> exp Idmap.t * stmt list

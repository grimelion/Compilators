

(* Flatten expressions so that they follow this grammar. We don't introduce a
   new type, but do define predicates on the SourceAst.exp type. 

   type ae =
   | Num of int64
   | Bool of bool
   | Ident of SourceAst.id

   type flat_exp =
   | Num of int64
   | Bool of bool
   | Ident of SourceAst.id * ae list
   | Op of ae * op * ae
   | Uop of ae
   | Array of ae list
 *)

open SourceAst
val unnest : stmt list -> stmt list
val is_atomic : exp -> bool
val is_flat : exp -> bool

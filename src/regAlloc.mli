

open BlockStructure

val reg_alloc : (SourceAst.id * int) list -> int -> cfg -> (cfg * int)

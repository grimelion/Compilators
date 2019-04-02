
(* Ensure that all immediate arguments fit into 32 bits.  We assume that
   constant propagation has ensured that no operation has two immediate
   arguments, and we maintain that property here. *)

val shrink_imm : BlockStructure.cfg -> BlockStructure.cfg

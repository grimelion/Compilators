

(* Convert linearised three-address code to x86-64 *)

val num_regs : int
val argument_reg_numbers : int list
val be_to_x86 : bool -> BlockStructure.block_elem -> X86.instruction list
val to_x86 : bool -> LineariseCfg.linear list -> int -> X86.instruction list

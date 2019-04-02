

(* Flatten the CFG into a list of three-address code. *)

open BlockStructure
type linear =
  | Instr of block_elem
  | CJump of test * bool * string (* jump to string if var is bool *)
  | Jump of string
  | Label of string
  | Return of var option

type linear_list = linear list

val cfg_to_linear : cfg -> linear list

val pp_linear_list : Format.formatter -> linear list -> unit

val init_traversal : cfg -> cfg_entry Util.Intmap.t

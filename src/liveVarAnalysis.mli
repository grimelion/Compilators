

open BlockStructure

type cfg_annot = { gen : Varset.t; kill : Varset.t; live_exit : Varset.t }

type cfg = (cfg_entry * cfg_annot) list

val pp_cfg : Format.formatter -> cfg -> unit

val lva : Varset.t -> BlockStructure.cfg -> cfg

val remove_unused_writes : cfg -> cfg

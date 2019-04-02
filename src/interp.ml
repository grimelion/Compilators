

(* Driver for interpreter executable. *)

let filename = ref None;;

let usage_msg =
  "example interpreter \nexample usage:    " ^ Sys.argv.(0)^ " test.expl\n";;

let _ =
  Arg.parse []
    (fun s ->
       match !filename with
       | None ->
         filename := Some s
       | Some s' ->
         (Format.printf "Error: given multiple files to run: %s and %s\n" s' s;
          exit 1))
    usage_msg;;

let _ =
  match !filename with
  | None ->
    (print_string usage_msg;
     exit 1)
  | Some filename ->
    AstInterp.interp_prog (FrontEnd.front_end filename false)

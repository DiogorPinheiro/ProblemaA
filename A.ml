open Printf
open Scanf
open List

(* --------------  Leitura e armazenamento de dados  -------------------------------*)
let n = scanf " %d" (fun n -> n)

let card_so = scanf " %d" (fun card_so -> card_so)  (* Cardinalidade de estados iniciais *)
let so = []                                         (* Lista de estados iniciais *)
let x,y,z = scanf " %d %d %d" (fun x y z -> x, y, z) 
let so = so @ [x]
let so = so @ [y]
let so = so @ [z]

let card_f = scanf " %d" (fun card_f -> card_f)     (* Cardinalidade de estados finais *)
let f = []                                          (* Lista de estados finais *)

let x1,y1,z1 = scanf " %d %d %d" (fun x1 y1 z1 -> x1, y1, z1) 
let f = f @ [x1]
let f = f @ [y1]
let f = f @ [z1]

let card_trans = scanf " %d" (fun card_trans -> card_trans) (* Número de transições *)
let transicoes = []

let rec armazenar_transicoes transicoes card_trans = (* Armazenar Transições *)
    if card_trans > 0 then
        let a1,a2,a3,a4,a5,a6 = scanf " %d %c %c %c %c %d " (fun a1 a2 a3 a4 a5 a6 -> a1,a2,a3,a4,a5,a6) in 
        let a4 = if a4 = '_' then (-1) else (int_of_char a4 - 48) in (* Converter para decimal *)
        let a5 = if a5 = '_' then (-1) else (int_of_char a5 - 48) in
        let x = (a1,a2,a3,a4,a5,a6) in 
        let transicoes = transicoes @ [x] in 
        armazenar_transicoes transicoes (card_trans-1) 
    else transicoes
     
let transicoes = armazenar_transicoes transicoes card_trans
let string_final = scanf " %s" (fun string_final -> string_final) (* String final *)
(*--------------------------------------------------------------------------------------------*)

let estado_atual = [] (* Lista com estados atuais constituídos por um tuple (a,x)  *)
(* a = estado atual (valor correspondente do caracter na string; x = valor inteiro que será atualizado*)

let rec num_vizinhos num transicoes cont = (* Encontrar número de vizinhos *)
  match transicoes with
       [] -> cont
       |(a1,a2,a3,a4,a5,a6)::tl -> if a1 = num then num_vizinhos num tl (cont+1) else num_vizinhos num tl cont

let rec is_estadofinal a1 f = (* Verificar se é estado final (se pertence à lista de estados finais)*)
    match f with
      |[] -> false
      |h::tl -> if h=a1 then true else is_estadofinal a1 tl
 
let conversao_booleano operacao a b = (*Converter operacao por booleano -> Evitar caso != que nao tem significado desejado em ocaml*)
    match operacao with
    | "_" -> true
    | "!=" -> a <> b
    | "<" -> a < b
    | ">" -> a > b
    | "=" -> a = b
    | "<=" -> a <= b
    | ">=" -> a>=b
    | _ -> false
(*
let is_possivel transicao f =
    let (a1,a2,a3,a4,a5,a6) = f in
    if a1 = 2 the 1 else 0
    
let x = [1,2,3,4,5,6]
let () = printf "%d" is_possivel transicao x
*)



(* Funcões de leitura adicionais (para testes) *)
(*
let rec print_arr lis =
  match lis with
  | [] -> printf "\n"
  | h::t -> printf "%d " h ;print_arr t
let () = print_arr so  
*)
(*)
let rec print_list lista =
    match lista with
    | [] -> printf "\n"
    | (a1,a2,a3,a4,a5,a6)::resto -> let () = printf "(%d, %c, %c, %d, %d, %d)\n" a1 a2 a3 a4 a5 a6 in print_list resto
let () = print_list transicoes 
*)

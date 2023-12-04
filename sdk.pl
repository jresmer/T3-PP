:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, 9), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is),
        As = [C11, C12, C13, C14, C15, C16, C17, C18, C19],
        Bs = [C21, C22, C23, C24, C25, C26, C27, C28, C29],
        Cs = [C31, C32, C33, C34, C35, C36, C37, C38, C39],
        Ds = [C41, C42, C43, C44, C45, C46, C47, C48, C49],
        Es = [C51, C52, C53, C54, C55, C56, C57, C58, C59],
        Fs = [C61, C62, C63, C64, C65, C66, C67, C68, C69],
        Gs = [C71, C72, C73, C74, C75, C76, C77, C78, C79],
        Hs = [C81, C82, C83, C84, C85, C86, C87, C88, C89],
        Is = [C91, C92, C93, C94, C95, C96, C97, C98, C99],
        %Referente ao tabuleiro específico
        C11 #> C12, C12 #< C13, C14 #< C15, C15 #> C16, C17 #< C18, C18 #> C19,
        C11 #> C21, C12 #< C22, C13 #< C23, C14 #> C24, C15 #> C25, C16 #< C26, C17 #< C27, C18 #> C28, C19 #< C29,
        C21 #> C22, C22 #< C23, C24 #< C25, C25 #< C26, C27 #> C28, C28 #< C29,
        C21 #< C31, C22 #< C32, C23 #> C33, C24 #< C34, C25 #< C35, C26 #> C36, C27 #> C37, C28 #< C38, C29 #< C39,
        C31 #> C32, C32 #> C33, C34 #< C35, C35 #> C36, C37 #< C38, C38 #< C39,
        C41 #< C42, C42 #> C43, C44 #< C45, C45 #> C46, C47 #> C48, C48 #< C49,
        C41 #< C51, C42 #> C52, C43 #> C53, C44 #< C54, C45 #> C55, C46 #< C56, C47 #> C57, C48 #< C58, C49 #> C59,
        C51 #> C52, C52 #> C53, C54 #> C55, C55 #< C56, C57 #< C58, C58 #> C59,
        C51 #> C61, C52 #> C62, C53 #< C63, C54 #< C64, C55 #< C65, C56 #< C66, C57 #< C67, C58 #> C68, C59 #< C69,
        C61 #> C62, C62 #< C63, C64 #< C65, C65 #> C66, C67 #> C68, C68 #< C69,
        C71 #< C72, C72 #> C73, C74 #> C75, C75 #< C76, C77 #> C78, C78 #< C79,
        C71 #> C81, C72 #< C82, C73 #< C83, C74 #> C84, C75 #< C85, C76 #< C86, C77 #< C87, C78 #> C88, C79 #> C89,
        C81 #< C82, C82 #> C83, C84 #> C85, C85 #< C86, C87 #> C88, C88 #< C89,
        C81 #> C91, C82 #> C92, C83 #< C93, C84 #< C94, C85 #> C95, C86 #> C96, C87 #> C97, C88 #< C98, C89 #< C99,
        C91 #< C92, C92 #< C93, C94 #> C95, C95 #< C96, C97 #< C98, C98 #> C99.

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).


problem(1, [[_, _, _, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _],
            [_, _, 3, _, _, _, _, _, _],
            [_, _, _, _, _, _, _, _, _]]).
            
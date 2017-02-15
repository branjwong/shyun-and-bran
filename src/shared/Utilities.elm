module Utilities exposing (listToTupleList)

listToTupleList : List a -> a -> List (a, a)
listToTupleList list default =
    case list of
        [] -> [(default,default)]
        [a] -> [(a,default)]
        a::xa ->
            case xa of
                [] -> [(default,default)]
                [b] -> [(a,b)]
                b::xb -> (a,b) :: (listToTupleList xb default)

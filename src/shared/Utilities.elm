module Utilities exposing (listToTripletList)

listToTripletList : List a -> a -> List (a, a, a)
listToTripletList list default =
    case list of
        [] -> [(default,default,default)]
        [a] -> [(a,default,default)]
        a::xa ->
            case xa of
                [] -> [(default,default,default)]
                [b] -> [(a,b,default)]
                b::xb ->
                    case xb of
                        [] -> [(default,default,default)]
                        [c] -> [(a,b,c)]
                        c::xc -> (a,b,c) :: (listToTripletList xc a)
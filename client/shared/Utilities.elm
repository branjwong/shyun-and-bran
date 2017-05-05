module Utilities exposing (listToTupleList, sortPreferences)


listToTupleList : List a -> a -> List ( a, a )
listToTupleList list default =
    case list of
        [] ->
            [ ( default, default ) ]

        [ a ] ->
            [ ( a, default ) ]

        a :: xa ->
            case xa of
                [] ->
                    [ ( default, default ) ]

                [ b ] ->
                    [ ( a, b ) ]

                b :: xb ->
                    ( a, b ) :: (listToTupleList xb default)


sortPreferences : ( String, String ) -> ( String, String ) -> Order
sortPreferences ( pref1, img1 ) ( pref2, img2 ) =
    let
        default =
            "Show Me Around"
    in
        if pref1 == default then
            GT
        else if pref2 == default then
            LT
        else
            compare pref1 pref2

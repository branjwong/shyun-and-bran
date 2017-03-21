module ViewUtilities exposing (gotoButton, blocks, faIcon)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events
import Model exposing (..)
import Utilities
import SharedStyles exposing (..)


{ id, class, classList } =
    SharedStyles.loginNamespace


faIcon : String -> Html msg
faIcon iconName =
    node "i"
        [ Attr.class iconName
        , attribute "aria-hidden" "true"
        ]
        []


gotoButton : Page -> String -> Html Msg
gotoButton page txt =
    div [ class [ FormSignIn ] ]
        [ button
            [ Attr.class "btn btn-lg btn-primary btn-block"
            , Events.onClick (Goto page)
            ]
            [ text txt ]
        ]


blocks : List String -> List String -> List Msg -> List String -> Html Msg
blocks prefList titles msgs images =
    let
        titles_ =
            Utilities.listToTupleList titles ""

        msgs_ =
            Utilities.listToTupleList msgs NoOp

        image_ =
            Utilities.listToTupleList images ""
    in
        div
            []
            (List.map3 (blockRow prefList) titles_ msgs_ image_)


blockRow : List String -> ( String, String ) -> ( Msg, Msg ) -> ( String, String ) -> Html Msg
blockRow prefList ( s1, s2 ) ( m1, m2 ) ( i1, i2 ) =
    let
        size =
            "xs"

        colWidth =
            6

        offset =
            0

        firstClass =
            if offset > 0 then
                secondClass ++ " col-" ++ size ++ "-offset-" ++ toString offset
            else
                secondClass

        secondClass =
            "col-" ++ size ++ "-" ++ toString colWidth
    in
        div
            [ Attr.class "row" ]
            [ div
                [ Attr.class firstClass ]
                [ block prefList s1 m1 i1 ]
            , div
                [ Attr.class secondClass ]
                [ block prefList s2 m2 i2 ]
            ]


block : List String -> String -> Msg -> String -> Html Msg
block prefList title event image =
    let
        rimClass =
            case List.member title prefList of
                True ->
                    BlockRimSelected

                False ->
                    BlockRim
    in
        if title /= "" then
            div
                [ class [ BlockDiv ] ]
                [ div
                    [ class [ rimClass ], Events.onClick event ]
                    [ div
                        [ class [ Block ]
                        , style [ ( "background-image", "url(" ++ image ++ ")" ) ]
                        ]
                        []
                    ]
                , div
                    [ style [ ( "text-align", "center" ) ] ]
                    [ text title ]
                ]
        else
            div [] []

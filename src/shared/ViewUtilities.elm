module ViewUtilities exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as Events

import Model exposing (..)

import Utilities

gotoButton : Page -> String -> Html Msg
gotoButton page txt =
    div [ class "form-signin" ] 
        [ button
            [ class "btn btn-lg btn-primary btn-block", type_ "undefined", Events.onClick (Goto page) ]
            [ text txt ]
        ]


blocks : List String -> List String ->  List Msg -> Html Msg
blocks prefList titles msgs =
    let 
        titles_ = Utilities.listToTripletList titles ""
        msgs_ = Utilities.listToTripletList msgs NoOp
    in
        div 
            []
            (List.map2 (blockRow prefList) titles_ msgs_)
        

blockRow : List String -> (String, String, String) -> (Msg, Msg, Msg) -> Html Msg
blockRow prefList (s1, s2, s3) (m1, m2, m3) = 
    div
        [ class "row" ]
        [ div
            [ class "col-sm-2 col-sm-offset-3" ]
            [ block prefList s1 m1 ]
        , div
            [ class "col-sm-2" ]
            [ block prefList s2 m2 ]
        , div
            [ class "col-sm-2" ]
            [ block prefList s3 m3 ]
        ]


block : List String -> String -> msg -> Html msg
block prefList title event =
    let
        rimClass = 
            case List.member title prefList of
                True -> "BlockRimSelected"
                False -> "BlockRim"
    in
        if title /= "" then
            div
                [ class "BlockDiv" ]
                [ div
                    [ class rimClass, Events.onClick event ]
                    [ div
                        [ class "Block" ]
                        []
                    ]
                , div
                    [ style [ ( "text-align", "center" ) ] ]
                    [ text title ]
                ]
            else 
                div [] []
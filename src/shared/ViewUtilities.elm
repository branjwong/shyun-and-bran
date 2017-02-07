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


blocks : List String -> List String ->  List Msg -> List String -> Html Msg
blocks prefList titles msgs images =
    let 
        titles_ = Utilities.listToTripletList titles ""
        msgs_ = Utilities.listToTripletList msgs NoOp
        image_ = Utilities.listToTripletList images ""
    in
        div 
            []
            (List.map3 (blockRow prefList) titles_ msgs_ image_)
        

blockRow : List String -> (String, String, String) -> (Msg, Msg, Msg) -> (String, String, String) -> Html Msg
blockRow prefList (s1, s2, s3) (m1, m2, m3) (i1, i2, i3) = 
    div
        [ class "row" ]
        [ div
            [ class "col-sm-2 col-sm-offset-3" ]
            [ block prefList s1 m1 i1 ]
        , div
            [ class "col-sm-2" ]
            [ block prefList s2 m2 i2 ]
        , div
            [ class "col-sm-2" ]
            [ block prefList s3 m3 i3 ]
        ]


block : List String -> String -> Msg -> String -> Html Msg
block prefList title event image =
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
                        [ class "Block"
                        , style [ ("background-image", "url(" ++ image ++ ")" ) ]
                        ]
                        []
                    ]
                , div
                    [ style [ ( "text-align", "center" ) ] ]
                    [ text title ]
                ]
            else 
                div [] []
                

sortPreferences : (String, String) -> (String, String) -> Order
sortPreferences (pref1, img1) (pref2, img2) =
    let 
        default = "Show Me Around"
    in
        if pref1 == default then
            GT
        else if pref2 == default then
            LT
        else
            compare pref1 pref2
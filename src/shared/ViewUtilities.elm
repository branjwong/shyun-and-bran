module ViewUtilities exposing (gotoButton, blocks, localProfile)

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
        titles_ = Utilities.listToTupleList titles ""
        msgs_ = Utilities.listToTupleList msgs NoOp
        image_ = Utilities.listToTupleList images ""
    in
        div 
            []
            (List.map3 (blockRow prefList) titles_ msgs_ image_)
        

blockRow : List String -> (String, String) -> (Msg, Msg) -> (String, String) -> Html Msg
blockRow prefList (s1, s2) (m1, m2) (i1, i2) =
    let
        size = "xs"
        colWidth = 6
        offset = 0

        firstClass =
            if offset > 0 then
                secondClass ++ " col-" ++ size ++ "-offset-" ++ toString offset
            else
                secondClass

        secondClass = "col-" ++ size ++ "-" ++ toString colWidth
    in
        div
            [ class "row" ]
            [ div
                [ class firstClass ]
                [ block prefList s1 m1 i1 ]
            , div
                [ class secondClass ]
                [ block prefList s2 m2 i2 ]
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

localProfile : Html Msg
localProfile =
    div [ class "thumbnail" ]
    [ img [ alt "100%x200", attribute "data-holder-rendered" "true", attribute "data-src" "holder.js/100%x200", src "http://www.sephora.com/contentimages/categories/makeup/CONTOURING/030515/animations/round/round_01_before.jpg?country_switch=ca&lang=en", attribute "style" "height: 200px; display: block;" ]
        []
    , div [ class "caption" ]
        [ h3 []
            [ text "Thumbnail label" ]
        , p []
            [ text "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit." ]
        , p []
            [ a [ class "btn btn-primary", href "#", attribute "role" "button" ]
                [ text "Button" ]
            , a [ class "btn btn-default", href "#", attribute "role" "button" ]
                [ text "Button" ]
            ]
        ]
    ]

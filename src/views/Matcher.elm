module Matcher exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..) 

import Model exposing (..)

import ViewUtilities

view : Html Msg
view =
    let
        name = "Loser Dude"
        desc = "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit."
        url =  "http://www.sephora.com/contentimages/categories/makeup/CONTOURING/030515/animations/round/round_01_before.jpg?country_switch=ca&lang=en"
    in
        div 
            [ class "container" ]
            [ localProfile name url desc
            , ViewUtilities.gotoButton MainMenu "Back to Main Menu" ]

localProfile : String -> String -> String -> Html Msg
localProfile profileName imgUrl description =
    div [ class "thumbnail" ]
        [ img 
            [ attribute "data-holder-rendered" "true"
            , attribute "data-src" "holder.js/100%x200"
            , src imgUrl 
            , attribute "style" "height: 200px; display: block;" 
            ]
            []
        , div [ class "caption" ]
            [ h3 []
                [ text profileName ]
            , p []
                [ text description ]
            , p []
                [ a [ class "btn btn-primary", href "#", attribute "role" "button" ]
                    [ text "Button" ]
                , a [ class "btn btn-default", href "#", attribute "role" "button" ]
                    [ text "Button" ]
                ]
            ]
        ]


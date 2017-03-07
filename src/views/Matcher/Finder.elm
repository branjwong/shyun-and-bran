module Matcher.Finder exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..) 

import Model exposing (..)

import ViewUtilities

view : Model -> Html Msg
view model =
    div 
        [ class "container" ]
        [ localProfile (testUser model)
        , ViewUtilities.gotoButton MainMenu "Back to Main Menu" 
        ]

testUser : Model -> User
testUser model = 
    let
        name = "Mayo Naise"
        desc = "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit."
        url =  "http://www.sephora.com/contentimages/categories/makeup/CONTOURING/030515/animations/round/round_01_before.jpg?country_switch=ca&lang=en"
        pref = model.preferences
    in 
        User name url desc pref

localProfile : User -> Html Msg
localProfile user =
    div [ class "thumbnail" ]
        [ div 
            [ style
                [ ("padding-top", "20px") ]
            ]
            [ img 
                [ src user.imgUrl 
                , style
                    [ ("height", "200px")
                    , ("margin-right", "auto")
                    , ("margin-left", "auto")
                    , ("display", "block")
                    ]
                ]
                []
            ]
        , div [ class "caption" ]
            [ h3 []
                [ text user.profileName ]
            , p []
                [ text (toString user.preferences) ]
            ]
        ]
module Matcher.Profile exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..) 
import Html.Events as Events

import Model exposing (..)

import ViewUtilities

view : User -> Html Msg
view user =
    div 
        [ class "container" ]
        [ localProfile user
        , ViewUtilities.gotoButton MainMenu "Back to Main Menu" 
        ]

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
                , Events.onClick LookAwayFromUser
                ]
                []
            ]
        , div [ class "caption" ]
            [ h3 []
                [ text user.profileName ]
            , p []
                [ text (toString user.description) ]
            ]
        ]
module Login exposing (view)

import Model exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events exposing (..)
import Localization


view : Html Msg
view =
    div
        [ class "container" ]
        [ div
            [ class "form-signin" ]
            [ h2
                [ class "form-signin-heading" ]
                [ text (Localization.getLocal "login" "heading") ]
            , label
                [ for "inputEmail", class "sr-only" ]
                [ text (Localization.getLocal "login" "placeholder_email") ]
            , input
                [ type_ "undefined"
                , id "inputEmail"
                , class "form-control"
                , placeholder (Localization.getLocal "login" "placeholder_email")
                , required True
                , autofocus True
                ]
                []
            , label
                [ for "inputPassword", class "sr-only" ]
                [ text (Localization.getLocal "login" "placeholder_password") ]
            , input
                [ type_ "undefined"
                , id "inputPassword"
                , class "form-control"
                , placeholder (Localization.getLocal "login" "placeholder_password")
                , required True
                ]
                []
            , button
                [ class "btn btn-lg btn-primary btn-block", type_ "undefined", Events.onClick (Goto MainMenu) ]
                [ text (Localization.getLocal "login" "button") ]
            ]
        ]

module Login exposing (view)

import Html exposing (..)
import Html.CssHelpers exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events exposing (..)
import Model exposing (..)
import Localization
import SharedStyles exposing (..)
import Bootstrap.Grid as Grid


{ id, class, classList } =
    SharedStyles.loginNamespace


view : Html Msg
view =
    Grid.container
        [ class [ FormSignIn ] ]
        [ h2
            [ class [ SignInHeading ] ]
            [ text (Localization.getLocal "login" "heading") ]
        , label
            [ for "inputEmail", Attr.class "sr-only" ]
            [ text (Localization.getLocal "login" "placeholder_email") ]
        , input
            [ type_ "email"
            , class [ FormControl ]
            , placeholder (Localization.getLocal "login" "placeholder_email")
            , required True
            , autofocus True
            ]
            []
        , input
            [ type_ "password"
            , class [ FormControl ]
            , placeholder (Localization.getLocal "login" "placeholder_password")
            , required True
            ]
            []
        , button
            [ Attr.class "btn btn-lg btn-primary btn-block", type_ "undefined", Events.onClick (Goto MainMenu) ]
            [ text (Localization.getLocal "login" "button") ]
        ]

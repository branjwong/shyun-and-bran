module MainMenu exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model exposing (..)

import Localization
import ViewUtilities

view : Html Msg
view =
    div
        [ class "container" ]
        [ h2 [ style [ ( "text-align", "center" ) ] ] [ text (Localization.getLocal "mainMenu" "title") ]
        , ViewUtilities.gotoButton PreferencesRoot (Localization.getLocal "mainMenu" "button_preferences")
        , ViewUtilities.gotoButton Matcher (Localization.getLocal "mainMenu" "button_matcher")
        , ViewUtilities.gotoButton Login (Localization.getLocal "mainMenu" "button_logout")
        ]
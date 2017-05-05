module MainMenu exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Localization
import ViewUtilities
import Bootstrap.Grid as Grid


view : Model -> Html Msg
view model =
    Grid.container []
        [ ViewUtilities.navbar model
        , h2 [ style [ ( "text-align", "center" ) ] ] [ text (Localization.getLocal "mainMenu" "title") ]
        , ViewUtilities.gotoButton PreferencesRoot (Localization.getLocal "navbar" "preferences")
        , ViewUtilities.gotoButton Matcher (Localization.getLocal "navbar" "matcher")
        , ViewUtilities.gotoButton Login (Localization.getLocal "navbar" "logout")
        ]

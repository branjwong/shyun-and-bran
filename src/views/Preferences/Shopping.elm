module Preferences.Shopping exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model exposing (..)

import ViewUtilities

view : Model -> Html Msg
view model = 
    let 
        items = List.sort [ "Shibuya", "Shinjuku", "Akihabara", "Ginza", "Tokyo Station" ] ++ [ "Show Me Around" ]
        msgs = List.map (AddPreference Shopping) items
    in
        div
            [ class "container" ]
            [ h2 [ style [ ( "text-align", "center" ) ] ] [ text "Change your shopping preferences" ]
            , ViewUtilities.blocks model.preferences.shopping items msgs
            , ViewUtilities.gotoButton PreferencesRoot "Back to Preference Select"
            ]
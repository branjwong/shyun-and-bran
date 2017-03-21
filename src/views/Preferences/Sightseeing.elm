module Preferences.Sightseeing exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import ViewUtilities
import Utilities


view : Model -> Html Msg
view model =
    let
        itemImagePairs =
            List.sortWith Utilities.sortPreferences
                [ ( "Sensoji", "" )
                , ( "Yokohama", "" )
                , ( "Akihabara", "" )
                , ( "Akihabara Electric City", "" )
                , ( "Ghibli Museum", "" )
                , ( "Show Me Around", "" )
                ]

        ( items, images ) =
            List.unzip itemImagePairs

        msgs =
            List.map (AddPreference Sightseeing) items
    in
        div
            [ class "container" ]
            [ h2 [ style [ ( "text-align", "center" ) ] ] [ text "Sightseeing Searchables" ]
            , ViewUtilities.blocks model.preferences.sightseeing items msgs images
            , ViewUtilities.gotoButton PreferencesRoot "Back to Searchables Select"
            ]

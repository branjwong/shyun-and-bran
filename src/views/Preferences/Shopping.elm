module Preferences.Shopping exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Utilities
import ViewUtilities


view : Model -> Html Msg
view model =
    let
        itemImagePairs =
            List.sortWith Utilities.sortPreferences
                [ ( "Shibuya", "http://www.japan-guide.com/g2/3007_02.jpg" )
                , ( "Shinjuku", "" )
                , ( "Akihabara", "" )
                , ( "Ginza", "" )
                , ( "Tokyo Station", "" )
                , ( "Show Me Around", "" )
                ]

        ( items, images ) =
            List.unzip itemImagePairs

        msgs =
            List.map (AddPreference Shopping) items
    in
        div
            [ class "container" ]
            [ h2 [ style [ ( "text-align", "center" ) ] ] [ text "Shopping Searchables" ]
            , ViewUtilities.blocks model.preferences.shopping items msgs images
            , ViewUtilities.gotoButton PreferencesRoot "Back to Searchables Select"
            ]

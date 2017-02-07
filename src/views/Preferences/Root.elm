module Preferences.Root exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model exposing (..)

import ViewUtilities


view : Model -> Html Msg
view model =
    let 
      items = ["Sightseeing", "Food", "Nightlife", "Shopping", "Surprise Me", "Up For Anything"]
      gotoPage item =
          case item of
              "Shopping" -> Goto PreferencesShopping
              _ -> NoOp
      msgs = List.map gotoPage items 
    in
      div
        [ class "container" ]
        [ div [] [ ViewUtilities.blocks model items msgs ]
        , ViewUtilities.gotoButton Login "Logout"
        ]
module Preferences.Shopping exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model exposing (..)

import ViewUtilities

view : Html Msg
view = 
    let 
        items = ["Shibuya", "Shinjuku", "Akihabara", "Ginza", "Tokyo Station", "Show Me Around"]
        msgs = List.map (AddPreference Shopping) items

    in
        div
            [ class "container" ]
            [ ViewUtilities.blocks items msgs ]
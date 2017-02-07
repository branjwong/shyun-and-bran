module View exposing (view)

import Model exposing (..)
import Html exposing (..)

import Login exposing (view)
import Preferences.Root exposing (view)
import Preferences.Shopping exposing (view)

view : Model -> Html Msg
view model =
    case model.page of
        Login ->
            Login.view
        SetupRoot ->
            Preferences.Root.view model 
        SetupShopping ->
            Preferences.Shopping.view model
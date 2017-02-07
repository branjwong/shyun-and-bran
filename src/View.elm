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
        PreferencesRoot ->
            Preferences.Root.view Model.blankModel 
        PreferencesShopping ->
            Preferences.Shopping.view model
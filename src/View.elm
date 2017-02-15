module View exposing (view)

import Model exposing (..)
import Html exposing (..)

import Login exposing (view)
import MainMenu exposing (view)
import Preferences.Root exposing (view)
import Preferences.Shopping exposing (view)
import Preferences.Sightseeing exposing (view)
import Matcher exposing (view)

view : Model -> Html Msg
view model =
    case model.page of
        Login ->
            Login.view
        MainMenu ->
            MainMenu.view
        PreferencesRoot ->
            Preferences.Root.view Model.blankModel 
        PreferencesShopping ->
            Preferences.Shopping.view model
        PreferencesSightseeing ->
            Preferences.Sightseeing.view model
        Matcher ->
            Matcher.view
            
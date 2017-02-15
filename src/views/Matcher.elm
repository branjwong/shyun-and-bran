module Matcher exposing (view)

import Html exposing (..)

import Model exposing (..)

import ViewUtilities

view : Html Msg
view =
    ViewUtilities.gotoButton MainMenu "Back to Main Menu"

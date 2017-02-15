module Matcher exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..) 

import Model exposing (..)

import ViewUtilities

view : Html Msg
view =
    div 
        [ class "container" ]
        [ ViewUtilities.localProfile
        , ViewUtilities.gotoButton MainMenu "Back to Main Menu" ]

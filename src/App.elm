module App exposing (main)

import Model exposing (..)
import Update exposing (..)
import View

import Html exposing (program)

main : Program Never Model Msg
main =
    Html.program 
        { init = init
        , update = Update.update
        , view = View.view
        , subscriptions = (\_ -> Sub.none)
        } 

init : (Model, Cmd Msg)
init = 
    { page = Login 
    , preferences = 
        { shopping = [] }
    } 
        ! 
        [ Cmd.none ]

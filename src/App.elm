module App exposing (main)

import Model exposing (Model, Msg(..))
import DevSettings
import Update
import View
import Html exposing (program)
import Bootstrap.Navbar as Navbar


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = Update.update
        , view = View.view
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    DevSettings.devModel ! [ Cmd.none ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navbarState NavbarMsg

module Update exposing (..)

import Model exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    let model_ =
        case Debug.log "update" msg of
            NoOp ->
                model
            Goto page ->
                { model | page = page }
            AddShoppingPreference pref ->
                { model | shoppingPreferences = (pref :: model.shoppingPreferences) }
    in
        model_ ! [ Cmd.none ]
                    

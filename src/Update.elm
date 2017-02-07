module Update exposing (..)

import Model exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    let 
        preferences = model.preferences
        model_ =
            case Debug.log "update" msg of
                NoOp ->
                    model
                Goto page ->
                    { model | page = page }
                AddPreference prefType pref ->
                    case prefType of
                        Shopping ->
                            case List.member pref model.preferences.shopping of
                                True ->
                                    { model 
                                        | preferences = { preferences 
                                            | shopping = List.filter (\str -> str /= pref) model.preferences.shopping }
                                    }
                                False ->
                                    { model 
                                        | preferences = { preferences 
                                            | shopping = (pref :: model.preferences.shopping) } 
                                    }
    in
        model_ ! [ Cmd.none ]

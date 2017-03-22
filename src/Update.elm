module Update exposing (..)

import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        model_ =
            case Debug.log "update" msg of
                NoOp ->
                    model

                Goto page ->
                    { model | page = page }

                AddPreference prefType pref ->
                    handlePreferenceList prefType pref model

                LookAtUser user ->
                    { model | userBeingViewed = Just user }

                LookAwayFromUser ->
                    { model | userBeingViewed = Nothing }

                Look direction ->
                    case direction of
                        Right ->
                            { model
                                | rightMatches = List.drop 1 model.rightMatches
                                , leftMatches =
                                    case List.head model.rightMatches of
                                        Just user ->
                                            user :: model.leftMatches

                                        Nothing ->
                                            model.leftMatches
                                , userBeingViewed = Nothing
                            }

                        Left ->
                            { model
                                | leftMatches = List.drop 1 model.leftMatches
                                , rightMatches =
                                    case List.head model.leftMatches of
                                        Just user ->
                                            user :: model.rightMatches

                                        Nothing ->
                                            model.rightMatches
                                , userBeingViewed = Nothing
                            }
    in
        model_ ! [ Cmd.none ]


handlePreferenceList : PreferenceType -> String -> Model -> Model
handlePreferenceList prefType pref model =
    let
        preferences =
            model.preferences
    in
        case prefType of
            Shopping ->
                case List.member pref model.preferences.shopping of
                    True ->
                        { model
                            | preferences =
                                { preferences
                                    | shopping = List.filter (\str -> str /= pref) model.preferences.shopping
                                }
                        }

                    False ->
                        { model
                            | preferences =
                                { preferences
                                    | shopping = (pref :: model.preferences.shopping)
                                }
                        }

            Sightseeing ->
                case List.member pref model.preferences.sightseeing of
                    True ->
                        { model
                            | preferences =
                                { preferences
                                    | sightseeing = List.filter (\str -> str /= pref) model.preferences.sightseeing
                                }
                        }

                    False ->
                        { model
                            | preferences =
                                { preferences
                                    | sightseeing = (pref :: model.preferences.sightseeing)
                                }
                        }

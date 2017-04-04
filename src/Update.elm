module Update exposing (..)

import Model exposing (..)
import Bootstrap.Navbar as Navbar


updateModel : Msg -> Model -> Model
updateModel msg model =
    case Debug.log "update" msg of
        NoOp ->
            model

        Goto _ ->
            model

        NavbarMsg state ->
            { model | navbarState = state }

        AddPreference prefType pref ->
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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Goto page ->
            let
                ( state, cmd ) =
                    Navbar.initialState NavbarMsg
            in
                { model
                    | page = page
                    , navbarState = state
                }
                    ! [ cmd ]

        _ ->
            (updateModel msg model) ! [ Cmd.none ]

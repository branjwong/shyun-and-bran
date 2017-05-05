module Matcher.Finder exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events
import Model exposing (..)
import ViewUtilities
import SharedStyles exposing (..)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row


{ id, class, classList } =
    SharedStyles.loginNamespace


view : Model -> Html Msg
view model =
    Grid.container []
        [ ViewUtilities.navbar model
        , localProfile model
        ]


showInfos : User -> Html msg
showInfos user =
    let
        shopping =
            user.preferences.shopping
                |> List.map createPill

        sightseeing =
            user.preferences.sightseeing
                |> List.map createPill
    in
        List.foldl List.append [] [ shopping, sightseeing ]
            |> div []


createPill : String -> Html msgs
createPill str =
    span [ Attr.class "badge badge-pill badge-default" ] [ text str ]


localProfile : Model -> Html Msg
localProfile model =
    let
        arrow model direction =
            let
                faClass =
                    case direction of
                        Left ->
                            "fa fa-arrow-circle-o-left fa-2x"

                        Right ->
                            "fa fa-arrow-circle-o-right fa-2x"

                event =
                    if direction == Left && List.isEmpty model.leftMatches then
                        NoOp
                    else if direction == Right && List.length model.rightMatches <= 1 then
                        NoOp
                    else
                        Look direction

                arrowClass =
                    if direction == Left && List.isEmpty model.leftMatches then
                        [ FadeClass ]
                    else if direction == Right && List.length model.rightMatches <= 1 then
                        [ FadeClass ]
                    else
                        []
            in
                Grid.col
                    [ Col.attrs
                        [ Attr.class "text-center"
                        , Events.onClick event
                        , class arrowClass
                        ]
                    , Col.xs2
                    ]
                    [ ViewUtilities.faIcon faClass ]
    in
        case List.head model.rightMatches of
            Nothing ->
                text "No Users To Look At"

            Just user ->
                let
                    caption =
                        case model.userBeingViewed of
                            Just user ->
                                text (toString user.description)

                            Nothing ->
                                showInfos user

                    event =
                        case model.userBeingViewed of
                            Just user ->
                                LookAwayFromUser

                            Nothing ->
                                LookAtUser user
                in
                    Grid.row
                        [ Row.attrs
                            [ Attr.class "align-items-center justify-content-center"
                            , class [ FinderBody ]
                            ]
                        ]
                        [ arrow model Left
                        , Grid.col []
                            [ h3
                                [ Attr.class "text-center" ]
                                [ text user.profileName ]
                            , node "figure"
                                [ Attr.class "figure"
                                , class [ FinderFigure ]
                                ]
                                [ img
                                    [ src user.imgUrl
                                    , Attr.class "figure-img img-fluid rounded"
                                    , class [ FinderFace ]
                                    , Events.onClick event
                                    ]
                                    []
                                , node "figcaption"
                                    [ Attr.class "figure-caption text-center"
                                    , class [ FinderInfo ]
                                    ]
                                    [ caption ]
                                ]
                            ]
                        , arrow model Right
                        ]

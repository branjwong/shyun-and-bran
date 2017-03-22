module Matcher.Profile exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events
import Model exposing (..)
import ViewUtilities
import SharedStyles exposing (..)


{ id, class, classList } =
    SharedStyles.loginNamespace


view : User -> Html Msg
view user =
    div
        [ Attr.class "container" ]
        [ localProfile user
        , ViewUtilities.gotoButton MainMenu "Back to Main Menu"
        ]


localProfile : User -> Html Msg
localProfile user =
    let
        arrow str =
            div
                [ Attr.class "col-2 text-center" ]
                [ ViewUtilities.faIcon ("fa fa-arrow-circle-o-" ++ str) ]
    in
        div
            [ Attr.class "row align-items-center justify-content-center"
            , class [ FinderBody ]
            ]
            [ arrow "left"
            , div
                [ Attr.class "col"
                ]
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
                        , Events.onClick LookAwayFromUser
                        ]
                        []
                    , node "figcaption"
                        [ Attr.class "figure-caption text-center"
                        , class [ FinderInfo ]
                        ]
                        [ text (toString user.description)
                        ]
                    ]
                ]
            , arrow "right"
            ]

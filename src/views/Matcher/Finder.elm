module Matcher.Finder exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events
import Model exposing (..)
import ViewUtilities
import SharedStyles exposing (..)


{ id, class, classList } =
    SharedStyles.loginNamespace


view : Model -> Html Msg
view model =
    div
        [ Attr.class "container" ]
        [ localProfile (testUser)
        , ViewUtilities.gotoButton MainMenu "Back to Main Menu"
        ]


testUser : User
testUser =
    let
        name =
            "Mayo Naise"

        desc =
            "I love going for walks in your mom's house."

        url =
            "http://www.sephora.com/contentimages/categories/makeup/CONTOURING/030515/animations/round/round_01_before.jpg?country_switch=ca&lang=en"

        pref =
            { shopping = [ "Flowers", "Clothes" ]
            , sightseeing = [ "Your Mom's House", "My Mom's House" ]
            }
    in
        User name url desc pref


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
                        , Events.onClick (LookAtUser user)
                        ]
                        []
                    , node "figcaption"
                        [ Attr.class "figure-caption text-center"
                        , class [ FinderInfo ]
                        ]
                        [ showInfos user
                        ]
                    ]
                ]
            , arrow "right"
            ]

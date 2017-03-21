module Matcher.Finder exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Events
import Model exposing (..)
import ViewUtilities exposing (faIcon)
import SharedStyles exposing (..)


{ id, class, classList } =
    SharedStyles.loginNamespace


view : Model -> Html Msg
view model =
    div
        [ Attr.class "container" ]
        [ localProfile (testUser model)
        , ViewUtilities.gotoButton MainMenu "Back to Main Menu"
        ]


testUser : Model -> User
testUser model =
    let
        name =
            "Mayo Naise"

        desc =
            "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit."

        url =
            "http://www.sephora.com/contentimages/categories/makeup/CONTOURING/030515/animations/round/round_01_before.jpg?country_switch=ca&lang=en"

        pref =
            model.preferences
    in
        User name url desc pref


localProfile : User -> Html Msg
localProfile user =
    let
        arrow str =
            div
                [ Attr.class "col-2"
                , class [ FaArrow ]
                ]
                [ faIcon ("fa fa-arrow-circle-o-" ++ str) ]
    in
        div
            [ Attr.class "thumbnail" ]
            [ div
                [ Attr.class "row align-items-center justify-content-center" ]
                [ arrow "left"
                , div
                    [ Attr.class "col" ]
                    [ div
                        [ style
                            [ ( "padding-top", "20px" ) ]
                        ]
                        [ img
                            [ src user.imgUrl
                            , class [ FinderFace ]
                            , Events.onClick (LookAtUser user)
                            ]
                            []
                        ]
                    , div
                        [ Attr.class "caption" ]
                        [ h3 []
                            [ text user.profileName ]
                        , p []
                            [ text (toString user.preferences) ]
                        ]
                    ]
                , arrow "right"
                ]
            ]

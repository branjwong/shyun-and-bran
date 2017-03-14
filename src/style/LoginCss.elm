module LoginCss exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements exposing (..)
import SharedStyles exposing (..)


css =
    (stylesheet << namespace loginNamespace.name)
        [ body
            [ paddingTop (px 40)
            , paddingBottom (px 40)
            , backgroundColor (hex "eee")
            ]
        , class FormSignIn
            [ maxWidth (px 330)
            , padding (px 15)
            , margin2 zero auto
            , descendants
                [ class FormSignInHeading
                    [ marginBottom (px 10) ]
                , class FormControl
                    [ position relative
                    , height auto
                    , width (pct 100)
                    , border3 (px 1) solid (hex "ccc")
                    , borderRadius (px 4)
                    , property "-webkit-box-sizing" "border-box"
                    , property "-moz-box-sizing" "border-box"
                    , property "box-sizing" "border-box"
                    , padding (px 10)
                    , fontSize (px 16)
                    , focus
                        [ zIndex (int 2) ]
                    ]
                , selector "input[type=\"email\"]"
                    [ marginBottom (px -1)
                    , borderBottomRightRadius zero
                    , borderBottomLeftRadius zero
                    ]
                , selector "input[type=\"password\"]"
                    [ marginBottom (px 10)
                    , borderTopLeftRadius zero
                    , borderTopRightRadius zero
                    ]
                ]
            ]
        ]
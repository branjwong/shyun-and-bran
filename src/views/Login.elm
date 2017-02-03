module Login exposing (view)

import Model exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..) 
import Html.Events as Events exposing (..)

view : Html Msg
view =
    div
      [ class "container" ]
      [ div
          [ class "form-signin" ]
          [ h2
              [ class "form-signin-heading" ]
              [ text "Please sign in" ]
          , label
              [ for "inputEmail", class "sr-only" ]
              [ text "Email address" ]
          , input
              [ type_ "undefined", id "inputEmail", class "form-control", placeholder "Email address", required True, autofocus True ]
              []
          , label
              [ for "inputPassword", class "sr-only" ]
              [ text "Password" ]
          , input
              [ type_ "undefined", id "inputPassword", class "form-control", placeholder "Password", required True ]
              []
          , div
              [ class "checkbox" ]
              [ label
                  []
                  [ input
                      [ type_ "checkbox", value "remember-me" ]
                      []
                  , text "Remember me"
                  ]
              ]
          , button
              [ class "btn btn-lg btn-primary btn-block", type_ "undefined", Events.onClick (Goto SetupRoot) ]
              [ text "Sign in" ]
          ]
      ]

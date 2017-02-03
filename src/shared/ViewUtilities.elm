module ViewUtilities exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as Events

import Model exposing (..)

import Utilities

blocks : List String ->  List Msg -> Html Msg
blocks titles msgs =
    let 
        titles_ = Utilities.listToTripletList titles ""
        msgs_ = Utilities.listToTripletList msgs NoOp
    in
        div 
            []
            (List.map2 blockRow titles_ msgs_)
        

blockRow : (String, String, String) -> (Msg, Msg, Msg) -> Html Msg
blockRow (s1, s2, s3) (m1, m2, m3) = 
    div
        [ class "row" ]
        [ div
            [ class "col-sm-2 col-sm-offset-3" ]
            [ block s1 m1 ]
        , div
            [ class "col-sm-2" ]
            [ block s2 m2 ]
        , div
            [ class "col-sm-2" ]
            [ block s3 m3 ]
        ]


block : String -> msg -> Html msg
block title event =
    if title /= "" then
        div
            [ class "BlockDiv" ]
            [ div
                [ class "BlockRim", Events.onClick event ]
                [ div
                    [ class "Block" ]
                    []
                ]
            , div
                [ style
                    [ ( "text-align", "center" ) ]
                ]
                [ text title ]
            ]
        else 
            div [] []
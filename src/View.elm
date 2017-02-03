module View exposing (..)

import Model exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (..) 
import Html.Events as Events exposing (..)


view : Model -> Html Msg
view model =
    case model.page of
        Login ->
            loginView
        SetupPreferences ->
            setupPreferencesView
        SetupPreferencesShopping ->
            setupShoppingPreferencesView
                
loginView : Html Msg
loginView =
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
              [ class "btn btn-lg btn-primary btn-block", type_ "undefined", Events.onClick (Goto SetupPreferences) ]
              [ text "Sign in" ]
          ]
      ]

setupPreferencesView : Html Msg
setupPreferencesView =
    let 
        items = ["Sightseeing", "Food", "Nightlife", "Shopping", "Surprise Me", "Up For Anything"]
        msgs = List.map (\_ -> Goto SetupPreferencesShopping) items 
    in
        div
            [ class "container" ]
            [ div
                [ class "HomeContainer" ]
                [ blocks items msgs ]
            ]
        
        
setupShoppingPreferencesView : Html Msg
setupShoppingPreferencesView = 
    let 
        items = ["Shibuya", "Shinjuku", "Akihabara", "Ginza", "Tokyo Station", "Show Me Around"]
        msgs = List.map AddShoppingPreference items

    in
        div
            [ class "container" ]
            [ blocks items msgs ]


listToTripletList : List a -> a -> List (a, a, a)
listToTripletList list default =
    case list of
        [] -> [(default,default,default)]
        [a] -> [(a,default,default)]
        a::xa ->
            case xa of
                [] -> [(default,default,default)]
                [b] -> [(a,b,default)]
                b::xb ->
                    case xb of
                        [] -> [(default,default,default)]
                        [c] -> [(a,b,c)]
                        c::xc -> (a,b,c) :: (listToTripletList xc a)


blocks : List String ->  List Msg -> Html Msg
blocks titles msgs =
    let 
        titles_ = listToTripletList titles ""
        msgs_ = listToTripletList msgs NoOp
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

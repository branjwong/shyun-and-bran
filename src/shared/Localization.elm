module Localization exposing (getLocal)

import Json.Decode as Decode exposing (Decoder)
import Dict exposing (Dict)


englishJson : String
englishJson =
    """
    { "login" :
        { "heading" : "Please Sign In"
        , "placeholder_email" : "Email address"
        , "placeholder_password" : "Password"
        , "button" : "Log In"
        }
    , "mainMenu" :
        { "title" : "Main Menu"
        , "button_preferences" : "Searchables"
        , "button_matcher" : "Find Friends"
        , "button_logout" : "Logout"
        }
    }
    """


localizationDecoder : Decoder (Dict String (Dict String String))
localizationDecoder =
    Decode.dict (Decode.dict Decode.string)


english : Dict String (Dict String String)
english =
    Decode.decodeString localizationDecoder englishJson
        |> Result.withDefault Dict.empty


getLocal : String -> String -> String
getLocal pageKey textKey =
    Dict.get pageKey english
        |> Maybe.withDefault Dict.empty
        |> Dict.get textKey
        |> Maybe.withDefault ""

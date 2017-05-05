module Localization exposing (getLocal, localizationDecoder, english)

import Json.Decode as Decode exposing (Decoder)
import Dict exposing (Dict)
import Http


englishJson : String
englishJson =
    """
    { "general" :
        { "app_name" : "ShowMeAround"
        }
    , "navbar" :
        { "preferences" : "Searchables"
        , "matcher" : "Find Friends"
        , "logout" : "Logout"
        }
    , "login" :
        { "heading" : "Please Sign In"
        , "placeholder_email" : "Email address"
        , "placeholder_password" : "Password"
        , "button" : "Log In"
        }
    , "mainMenu" :
        { "title" : "Main Menu"
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

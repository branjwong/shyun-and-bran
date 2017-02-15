module Localization exposing (getLocal)

import Json.Decode as Decode exposing (Decoder)
import Dict exposing (Dict)

englishJson : String
englishJson =
    """
    { "home" : 
        { "heading" : "Please Sign In" 
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
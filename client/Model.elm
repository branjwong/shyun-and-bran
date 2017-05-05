module Model exposing (..)

import Dict exposing (Dict)
import Localization
import Http
import Bootstrap.Navbar as Navbar


type alias Model =
    { page : Page
    , navbarState : Navbar.State
    , preferences : Preferences
    , userBeingViewed : Maybe User
    , leftMatches : List User
    , rightMatches : List User
    , localization : Dict String (Dict String String)
    }


type alias Preferences =
    { shopping : List String
    , sightseeing : List String
    }


blankModel : ( Model, Cmd Msg )
blankModel =
    let
        ( state, cmd ) =
            Navbar.initialState NavbarMsg
    in
        { page = Login
        , navbarState = state
        , preferences =
            { shopping = []
            , sightseeing = []
            }
        , userBeingViewed = Nothing
        , leftMatches = []
        , rightMatches = []
        , localization = Dict.empty
        }
            ! [ cmd, getEnglish ]


type alias User =
    { profileName : String
    , imgUrl : String
    , description : String
    , preferences : Preferences
    }


type Msg
    = NoOp
    | Goto Page
    | NavbarMsg Navbar.State
    | AddPreference PreferenceType String
    | LookAtUser User
    | Look NavDirection
    | LookAwayFromUser
    | LoadLocalization (Result Http.Error Localization)


type Page
    = Login
    | MainMenu
    | PreferencesRoot
    | PreferencesShopping
    | PreferencesSightseeing
    | Matcher


type NavDirection
    = Left
    | Right


type PreferenceType
    = Shopping
    | Sightseeing


type alias Localization =
    Dict String (Dict String String)


getEnglish : Cmd Msg
getEnglish =
    Http.send LoadLocalization <|
        Http.get "http://localhost:5000/english" Localization.localizationDecoder

module Model exposing (..)

import Bootstrap.Navbar as Navbar


type alias Model =
    { page : Page
    , navbarState : Navbar.State
    , preferences : Preferences
    , userBeingViewed : Maybe User
    , leftMatches : List User
    , rightMatches : List User
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
        }
            ! [ cmd ]


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

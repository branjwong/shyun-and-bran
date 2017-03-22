module Model exposing (..)


type alias Model =
    { page : Page
    , preferences : Preferences
    , userBeingViewed : Maybe User
    , leftMatches : List User
    , rightMatches : List User
    }


type alias Preferences =
    { shopping : List String
    , sightseeing : List String
    }


blankModel : Model
blankModel =
    { page = Login
    , preferences =
        { shopping = []
        , sightseeing = []
        }
    , userBeingViewed = Nothing
    , leftMatches = []
    , rightMatches = []
    }


devModel : Model
devModel =
    let
        model =
            blankModel

        preferences =
            model.preferences
    in
        { model
            | page = Matcher
        }


type alias User =
    { profileName : String
    , imgUrl : String
    , description : String
    , preferences : Preferences
    }


type Msg
    = NoOp
    | Goto Page
    | AddPreference PreferenceType String
    | LookAtUser User
    | LookAwayFromUser


type Page
    = Login
    | MainMenu
    | PreferencesRoot
    | PreferencesShopping
    | PreferencesSightseeing
    | Matcher


type PreferenceType
    = Shopping
    | Sightseeing

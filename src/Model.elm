module Model exposing (..)

type alias Model =
    { page : Page
    , preferences : Preferences
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
    } 

devModel : Model
devModel = 
    let 
        model = blankModel 
        preferences = model.preferences
    in
        { model 
            | page = MatcherFinder
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
    
type Page
    = Login
    | MainMenu
    | PreferencesRoot
    | PreferencesShopping
    | PreferencesSightseeing
    | MatcherFinder
    
type PreferenceType 
    = Shopping
    | Sightseeing
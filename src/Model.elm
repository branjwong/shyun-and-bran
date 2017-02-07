module Model exposing (..)

type alias Model =
    { page : Page
    , preferences : 
        { shopping : List String
        , sightseeing : List String
        }
    }
    

blankModel : Model
blankModel = 
    { page = Login 
    , preferences = 
        { shopping = []
        , sightseeing = []
        }
    } 

type Msg
    = NoOp
    | Goto Page
    | AddPreference PreferenceType String
    
type Page
    = Login 
    | PreferencesRoot
    | PreferencesShopping
    | PreferencesSightseeing
    
type PreferenceType 
    = Shopping
    | Sightseeing
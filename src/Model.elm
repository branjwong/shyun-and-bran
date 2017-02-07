module Model exposing (..)

type alias Model =
    { page : Page
    , preferences : 
        { shopping : List String }
    }
    

blankModel : Model
blankModel = 
    { page = Login 
    , preferences = 
        { shopping = [] }
    } 

type Msg
    = NoOp
    | Goto Page
    | AddPreference PreferenceType String
    
type Page
    = Login 
    | PreferencesRoot
    | PreferencesShopping
    
type PreferenceType 
    = Shopping
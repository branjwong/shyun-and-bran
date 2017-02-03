module Model exposing (..)

type alias Model =
    { page : Page
    , preferences : 
        { shopping : List String }
    }
    

type Msg
    = NoOp
    | Goto Page
    | AddPreference PreferenceType String
    
type Page
    = Login 
    | SetupRoot
    | SetupShopping
    
type PreferenceType 
    = Shopping
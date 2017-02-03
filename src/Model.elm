module Model exposing (..)

type alias Model =
    { page : Page
    , shoppingPreferences : List String
    }

type Msg
    = NoOp
    | Goto Page
    | AddShoppingPreference String
    
type Page
    = Login 
    | SetupPreferences
    | SetupPreferencesShopping 
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
            , rightMatches = testRightMatches
        }


testRightMatches : List User
testRightMatches =
    [ { profileName = "Mayo Naise"
      , description = "I love going for walks in your mom's house."
      , imgUrl = "http://www.sephora.com/contentimages/categories/makeup/CONTOURING/030515/animations/round/round_01_before.jpg?country_switch=ca&lang=en"
      , preferences =
            { shopping = [ "Flowers", "Clothes" ]
            , sightseeing = [ "Your Mom's House", "My Mom's House" ]
            }
      }
    , { profileName = "Generic Dude"
      , description = "Fear me, for I eat potatoes."
      , imgUrl = "http://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/durchschnittsgesichter/m(01-32)_gr.jpg"
      , preferences =
            { shopping = [ "Vegetables", "Farmer's Markets" ]
            , sightseeing = [ "Potato Farms", "Ireland" ]
            }
      }
    , { profileName = "Ruby Jade"
      , description = "I can do crazy shit with my mouth. ;]"
      , imgUrl = "http://www.japantrendshop.com/images/bigan-face-expander-thumb.jpg"
      , preferences =
            { shopping = [ "Sex Shops", "Big Black Dildos" ]
            , sightseeing = [ "Your bedroom", "My bedroom", "Club restrooms" ]
            }
      }
    ]


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

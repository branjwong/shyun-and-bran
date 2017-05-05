module SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


type CssClasses
    = Navbar
    | FormSignIn
    | FormSignInHeading
    | FormControl
    | SignInHeading
    | Block
    | BlockRim
    | BlockRimSelected
    | BlockDiv
    | FinderBody
    | FinderNavigationSideBar
    | FinderFigure
    | FinderFace
    | FinderInfo
    | FadeClass


type CssIds
    = InputEmail
    | InputPassword


loginNamespace =
    withNamespace "main"

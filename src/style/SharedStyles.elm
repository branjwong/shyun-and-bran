module SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


type CssClasses
    = FormSignIn
    | FormSignInHeading
    | FormControl
    | SignInHeading
    | Block
    | BlockRim
    | BlockRimSelected
    | BlockDiv


type CssIds
    = InputEmail
    | InputPassword


loginNamespace =
    withNamespace "main"

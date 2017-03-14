module SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


type CssClasses
    = FormSignIn
    | FormSignInHeading
    | FormControl
    | SignInHeading


type CssIds
    = InputEmail
    | InputPassword


loginNamespace =
    withNamespace "login"

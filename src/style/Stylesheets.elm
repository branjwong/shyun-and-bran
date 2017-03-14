port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import LoginCss


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "login.css", Css.File.compile [ LoginCss.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure

module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (h1, text)
import Html.Attributes exposing (class)
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


type alias Model =
    { url : Url.Url
    , key : Nav.Key
    }


init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( Model url key, Cmd.none )


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Browser.Document Msg
view model =
    { title = "AsAbAlAr"
    , body =
        [ h1 [ class "text-3xl font-bold underline text-clifford" ] [ text "Hello there wow!" ]
        ]
    }

module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (a, div, h1, li, span, text, ul)
import Html.Attributes exposing (class, href, width)
import Html.Events exposing (onMouseOut, onMouseOver)
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



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked _ ->
            ( model, Cmd.none )

        UrlChanged _ ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Театр АсАбАлАр"
    , body =
        [ div [ class "text-zinc-100 w-full p-8 text-center bg-linear-45 from-pink-950 to-pink-800" ]
            [ viewTitle ]
        , div [ class "center border-t-2 border-t-red-800/50 p-1 text-zinc-100 bg-linear-45 from-zinc-800 to-zinc-950" ]
            [ viewNavbar ]
        , div [ class "" ]
            []
        ]
    }


viewNavbar : Html.Html Msg
viewNavbar =
    ul [ class "mx-auto flex items-center place-content-center" ]
        [ viewNavLink "/" "Главная"
        , viewNavLink "/projects" "Проекты"
        ]


viewNavLink : String -> String -> Html.Html Msg
viewNavLink link t =
    li [ class "flex-none m-1 after:content-['/'] after:ml-2 last:after:content-[''] last:after:ml-0" ]
        [ a [ class "underline hover:text-zinc-400", href link ] [ text t ] ]


viewTitle : Html.Html Msg
viewTitle =
    h1 [ class "group text-5xl font-thin" ]
        [ viewTitleVisible "Ас"
        , viewTitleHidden "ланян"
        , viewTitleVisible "Аб"
        , viewTitleHidden "илкаламова"
        , viewTitleVisible "Ал"
        , viewTitleHidden "ина"
        , viewTitleVisible "Ар"
        , viewTitleHidden "тур"
        ]


viewTitleVisible : String -> Html.Html Msg
viewTitleVisible t =
    span [] [ text t ]


viewTitleHidden : String -> Html.Html Msg
viewTitleHidden t =
    span
        {- TODO: Make css transitiohttp://localhost:8000/projectsn to width auto -}
        [ class "text-left overflow-hidden align-bottom inline-block w-0 transition-[width] duration-300 ease-in-out group-hover:w-25"
        ]
        [ span [] [ text t ] ]

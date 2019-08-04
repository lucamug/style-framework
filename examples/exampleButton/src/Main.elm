module Main exposing (main)

import Element exposing (..)
import Element.Background
import Framework.Button as Button
import Framework.Color.Extra
import Framework.Modifier exposing (Modifier(..))
import Html


main : Html.Html a
main =
    let
        color =
            rgb255 150 150 0
    in
    layout [] <|
        column []
            [ el [ centerX, centerY ] <| Button.button [ Medium, Success, Outlined ] Nothing "Button"
            , text "--"
            , el [ Element.Background.color <| Framework.Color.Extra.darken 1 color ] <| text "darken"
            , el [ Element.Background.color <| Framework.Color.Extra.darken 0.8 color ] <| text "darken"
            , el [ Element.Background.color <| Framework.Color.Extra.darken 0.6 color ] <| text "darken"
            , el [ Element.Background.color <| Framework.Color.Extra.darken 0.4 color ] <| text "darken"
            , el [ Element.Background.color <| Framework.Color.Extra.darken 0.2 color ] <| text "darken"
            , el [ Element.Background.color <| color ] <| text "color"
            , el [ Element.Background.color <| Framework.Color.Extra.lighten 0.2 color ] <| text "lighten"
            , el [ Element.Background.color <| Framework.Color.Extra.lighten 0.4 color ] <| text "lighten"
            , el [ Element.Background.color <| Framework.Color.Extra.lighten 0.6 color ] <| text "lighten"
            , el [ Element.Background.color <| Framework.Color.Extra.lighten 0.8 color ] <| text "lighten"
            , el [ Element.Background.color <| Framework.Color.Extra.lighten 1 color ] <| text "lighten"
            , text "--"
            , el [ Element.Background.color <| Framework.Color.Extra.saturate 0.8 color ] <| text "saturate"
            , el [ Element.Background.color <| Framework.Color.Extra.saturate 0.6 color ] <| text "saturate"
            , el [ Element.Background.color <| Framework.Color.Extra.saturate 0.4 color ] <| text "saturate"
            , el [ Element.Background.color <| Framework.Color.Extra.saturate 0.2 color ] <| text "saturate"
            , el [ Element.Background.color <| color ] <| text "color"
            , el [ Element.Background.color <| Framework.Color.Extra.desaturate 0.2 color ] <| text "desaturate"
            , el [ Element.Background.color <| Framework.Color.Extra.desaturate 0.4 color ] <| text "desaturate"
            , el [ Element.Background.color <| Framework.Color.Extra.desaturate 0.6 color ] <| text "desaturate"
            , el [ Element.Background.color <| Framework.Color.Extra.desaturate 0.8 color ] <| text "desaturate"
            ]

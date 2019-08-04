module Framework.Color.Extra exposing
    ( darken, desaturate, lighten, maximumContrast, saturate
    , colorToHex, hexToColor
    , fromColor, toColor
    )

{-|


# Utilities

@docs darken, desaturate, lighten, maximumContrast, saturate


# Convertions to/from Hex

@docs colorToHex, hexToColor


# Convertions to/from Color.Color

@docs fromColor, toColor

-}

import Color
import Color.Accessibility
import Color.Convert
import Color.Manipulate
import Element


{-| Convert an Element.Color into a Color.Color
-}
toColor : Element.Color -> Color.Color
toColor elementColor =
    let
        cl =
            Element.toRgb elementColor
    in
    Color.rgba cl.red cl.green cl.blue cl.alpha


{-| Convert a Color.Color into an Element.Color
-}
fromColor : Color.Color -> Element.Color
fromColor elementColor =
    let
        cl =
            Color.toRgba elementColor
    in
    Element.rgba cl.red cl.green cl.blue cl.alpha


{-| Increase the saturation of a color
-}
saturate : Float -> Element.Color -> Element.Color
saturate offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.saturate offset cl


{-| Decrease the saturation of a color
-}
desaturate : Float -> Element.Color -> Element.Color
desaturate offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.desaturate offset cl


{-| Increase the lightning of a color
-}
lighten : Float -> Element.Color -> Element.Color
lighten offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.lighten offset cl


{-| Decrease the lightning of a color
-}
darken : Float -> Element.Color -> Element.Color
darken offset elementColor =
    let
        cl =
            toColor elementColor
    in
    fromColor <| Color.Manipulate.darken offset cl


{-| Converts a color to a hexadecimal string.
-}
colorToHex : Element.Color -> String
colorToHex elementColor =
    let
        cl =
            toColor elementColor
    in
    Color.Convert.colorToHex cl


{-| Returns the color with the highest contrast to the base color.
-}
maximumContrast : Element.Color -> Element.Color -> Element.Color -> Element.Color
maximumContrast elementColor dark_ bright =
    let
        cl =
            toColor elementColor

        colorList =
            [ toColor dark_, toColor bright ]

        maxContrast =
            Color.Accessibility.maximumContrast cl colorList
    in
    fromColor <| Maybe.withDefault (Color.rgb 0 0 0) maxContrast


{-| Converts a string to a color.
-}
hexToColor : String -> Element.Color
hexToColor string =
    let
        cl =
            Color.Convert.hexToColor string
    in
    fromColor <| Result.withDefault (Color.rgb 0 0 0) cl

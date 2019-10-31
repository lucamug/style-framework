# Style Framework

[Demo](https://lucamug.github.io/style-framework/)

## An experimental Style Framework built on top of elm-ui.

This is a Style Framework built on top of the great library [elm-ui](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/). It is still experimental. Major changes may happen at any time to this Repo. Feedbacks and contributions are welcome.

## Customization

The framework allows customization on several levels. Have a look at this [example code](https://github.com/lucamug/style-framework/tree/master/examples/exampleCustomized/src) to see how the customization is made.

In the image below: on the top left, the default version. On the bottom right the customized version.

[![Customization](https://lucamug.github.io/style-framework/images/framework-customizations-600.png)](https://lucamug.github.io/style-framework/)

## Style guide generator

The framework has a built-in style guide generator that can be used as a quick reference during the UI design. The style guide is generated using functions called `introspection` present in each module of the framework.

## Usage

This is a minimal example of the framework usage, it just displays a green button:
```elm
module Main exposing (main)

import Element exposing (layout)
import Framework.Button as Button
import Framework.Modifier exposing (Modifier(..))
import Html


main : Html.Html a
main =
    layout [] <|
        Button.button
            [ Medium
            , Success
            , Outlined
            ]
            Nothing
            "Button"
```
This is [the result](https://lucamug.github.io/style-framework/generated-exampleButton.html):

[![Button](https://lucamug.github.io/style-framework/images/framework-button-example.png)](https://lucamug.github.io/style-framework/exampleButton.html)

## Examples

For the entire list of examples, have a look at the [examples](https://github.com/lucamug/style-framework/tree/master/examples/) folder in the repo. It contains:

* [Button Example](https://lucamug.github.io/style-framework/generated-exampleSPA.html)
* [Customized Framework Example](https://lucamug.github.io/style-framework/generated-exampleCustomized.html)
* [Single Page Application Example](https://lucamug.github.io/style-framework/generated-exampleSPA.html)

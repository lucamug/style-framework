# Improvements

## Better API

API should be more similar to `elm-ui` and consistent across elements.

### Buttons

For example, button in `elm-ui`:

```
Element.Input.button :
    List (Attribute msg)
    -> { onPress : Maybe msg
       , label : Element msg
       }
    -> Element msg
```

Button now in `style-framework`:

```
Framework.button :
    List Modifier
    -> Maybe msg
    -> String
    -> Element msg
```

It could instead be like:

```
Element.Input.button :
    List (Attribute msg)
    ->  { onPress : Maybe msg
        , label : Element msg

        -- Extra values

        , modifiers : List Modifier
        }
    ->  Element msg
```

### Input fields

`elm-ui`:

```
Element.Input.text :
    List (Attribute msg)
    -> { onChange : String -> msg
       , text : String
       , placeholder : Maybe (Placeholder msg)
       , label : Label msg
       }
    -> Element msg
```

`style-framework`:

```
Framework.Input.text :
    List (Attribute msg)
    ->  { onChange : String -> msg
        , text : String
        , placeholder : Maybe (Placeholder msg)
        , label : Label msg

        -- Extra values
        
        , modifiers : List Modifier
        , field : field
        , labelHelper : Label msg
        , wrapperAttrs : List (Attribute msg)
        , focused : Maybe field
        , onEnter : Maybe (field -> msg)
        , onChangeField : Maybe (field -> String -> msg)
        , onFocus : Maybe (field -> msg)
        , onLoseFocus : Maybe (field -> msg)
        }
    -> Element msg
```

* modifiers : list of modifiers (i.e. Primary, Secondary, etc.) the same as Button. Do we need this?
* field : the type of the field, for example `Email`, `Password`, `Telephone`, etc. These are constructors of the type `Field`.
* labelHelper : an extra label usually used for display errors.
* wrapperAttrs : the Element.Input.text is wrapped inside another element, these are the attributes of this outer element.
* focused : if the field has focus. This could be of type `Maybe Field` or just a `Bool`. If it is a `Maybe Field`, we can just pass `model.focused`. If it is a boolean, we need to call a function with this type signature: `Maybe Field -> Field -> Bool`, and call the function with `model.focuse` and `Email`, for example.
* onEnter : the message that is sent if `Enter` is pressed while the field has focus
* onChangeField : the message that is sent when the user type something. There is already the standard `onChange` but this one also send out the `Field`, in case we want to reduce the number of messages.
* onFocus : similar to `onEnter` but the message is sent when the field is focused
* onLoseFocus : similar to `onEnter` but the message is sent when the field loose focus

Here we could add something for the validation that fire, for example, only the first time that the field loose focus, so that the validation can start. To avoid validating a field while the user is typing for the first time. But in this case we need to keep track of an extra boolean that need to be stored in the model

### Questions

* should we use `Field` to identify the field, so is not necessary to have large number of messages?
* do we need `modifiers`?

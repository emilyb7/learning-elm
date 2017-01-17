import Html exposing (..)
import Html.Attributes  exposing (..)
import Mouse exposing (..)


main =
  Html.program {
     init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }


-- MODEL

type alias Model = String

init: ( Model, Cmd Int )
init = ("Nothing", Cmd.none)


-- UPDATE

type Msg = Int

update : Int -> Model -> (Model, Cmd Int)

update msg model =
  case msg of
    x ->
    (toString x, Cmd.none)
{--update msg model =
  case msg of
    Increment ->
      ""
    Decrement ->
      ""--}

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Int
subscriptions model =
  Mouse.moves (\{x, y} -> x )


-- VIEW

view : Model -> Html Int
view model =
  div [ style [

    -- styles for parent div
    ("height", "100%"),
    ("width", "100%")


  ]]
    [ div [style [
      ("height", "100px"),
      ("width", "100px"),
      ("backgroundColor", "pink"),
      ("position", "absolute"),
      ("top", "150px"),
      ("left", "150px")
    ]] []

    , div [style [
      ("height", "100px"),
      ("width", "100px"),
      ("backgroundColor", "turquoise"),
      ("position", "absolute"),
      ("top", "150px"),
      ("left", "300px")
    ]] []

    , div [style [
      ("position", "absolute"),
      ("top", "300px"),
      ("left", "150px"),
      ("width", "250px"),
      ("textAlign", "center"),
      ("fontSize", "2em"),
      ("color", model)



    ]] [ text model ]


    ]

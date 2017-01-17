import Html exposing (Html, div, text)
import Html.Attributes  exposing (..)
import Mouse exposing (..)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = String

model : Model
model =
  "Nothing"


-- UPDATE

type Msg = Position Int Int

update : Msg -> Model -> Model

update msg model =
  case msg of
    Position x y ->
    "Turquoise"
{--update msg model =
  case msg of
    Increment ->
      ""

    Decrement ->
      ""--}

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions pos =
  Mouse.moves (\{x, y} -> Position x y)


-- VIEW

view : Model -> Html Msg
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

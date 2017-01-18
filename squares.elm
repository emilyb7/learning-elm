import Html exposing (..)
import Html.Attributes  exposing (..)
import Mouse exposing (..)
import Array exposing (..)


main =
  Html.program {
     init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
  }


-- MODEL

type alias Model = { x : Int, y : Int, color: String }

init: ( Model, Cmd Msg )
init = ({ x = 0, y = 0, color = "" }, Cmd.none)


-- UPDATE

color : Int -> Int -> String
color x y =
    if x > 150 && x < 250 && y > 150 && y < 250 then
        "pink"
    else if x > 300 && x < 400 && y > 150 && y < 250 then
        "turquoise"
    else
        ""

type Msg
    = Position Int Int

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Position x y ->
            ( { model | color = color x y }, Cmd.none )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Mouse.moves (\{ x, y } -> Position x y)


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
      ("color", model.color)



    ]] [ text model.color ]


    ]

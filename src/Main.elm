module Main exposing (..)

import Browser
import Css.Global
import Html.Styled as Html exposing (Html, div, img, text, toUnstyled)
import Html.Styled.Attributes exposing (src)
import Tailwind.Utilities exposing (globalStyles)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


type alias Character =
    { name : String
    , image : String
    }


type alias Model =
    { characters : List Character
    }


init : () -> ( Model, Cmd Msg )
init _ =
    let
        characters =
            [ { name = "Mercy"
              , image = "https://pbs.twimg.com/media/EIT8HEuXkAADqh9.jpg"
              }
            ]
    in
    ( { characters = characters }, Cmd.none )



-- UPDATE


type Msg
    = SelectCharacter


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectCharacter ->
            ( model, Cmd.none )



-- VIEW


characterPortrait : Character -> Html Msg
characterPortrait character =
    div [] [ img [ src character.image ] [], div [] [ text character.name ] ]


view : Model -> Html Msg
view model =
    div []
        [ Css.Global.global globalStyles
        , div [] (List.map characterPortrait model.characters)
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none

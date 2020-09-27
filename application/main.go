package main

import (
    "fmt"
    "os"
    "log"
    "net/http"
    "math/rand"
    "time"
    "encoding/json"
)

type Data struct {
    Text string
    ImageLocation string
}

type Response struct {
    Success bool
    Error string
    Data Data
}

// Normally, we'd use a lib like vyper to handle config. For ease of use this is done manually
var BaseUrl = os.Getenv("BASE_URL")
var AppPort = os.Getenv("PORT")

var weatherTypes = [3]Data {
    Data {
        Text: "It is sunny",
        ImageLocation: fmt.Sprintf("sun.svg"),
    },
    Data {
        Text: "It is cloudy",
        ImageLocation: fmt.Sprintf("cloud.svg"),
    },
    Data {
        Text: "It is raining",
        ImageLocation: fmt.Sprintf("rain.svg"),
    },
}

func handler(w http.ResponseWriter, r *http.Request) {
    rand.Seed(time.Now().UnixNano())
    res := Response{
        Success: true,
        Data: weatherTypes[rand.Intn(3)],
        Error: "",
    }
    resjson, err := json.Marshal(res)
    if err != nil {
        resjson, err = json.Marshal(Response{
            Success: false,
            Error: err.Error(),
            Data: Data{},
            })
    }
    w.Header().Set("Content-Type", "application/json; charset=utf-8")
    w.Header().Set("Access-Control-Allow-Origin", "*")
    fmt.Fprintf(w, string(resjson))
}

func main() {
    http.HandleFunc("/", handler)
    log.Fatal(http.ListenAndServe(":" + AppPort, nil))
}

package main

import (
  // "fmt"
//  "github.com/desmetrics/desmetrics"
		"desmetrics"
)

type EventData struct {
  companionLP int
  sendTime float64
  
}

func main() {
  desmetrics.Start()
}
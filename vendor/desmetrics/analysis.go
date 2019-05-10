package desmetrics

import "fmt"

type EventData struct {
  CompanionLP int
  SendTime    float64
  ReceiveTime float64
}

type LPData struct {
  LpId            int
  events          []EventData
  SentEvents      int
  ReceivedEvents  int
}

type ByReceiveTime []EventData

func (a ByReceiveTime) Len() int {
  return len(a)
}

func (a ByReceiveTime) Swap(i, j int) {
  a[i], a[j] = a[j], a[i]
}


func Start() {
     fmt.Println("Hello")
}


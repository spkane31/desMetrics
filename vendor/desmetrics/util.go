package desmetrics

import (
	"os"
	"fmt"
	"time"
	"encoding/json"
	"log"
)

type DesTraceData struct {
	SimulatorName string `json:"simulator_name"`
	ModelName string `json:"model_name"`
	OriginalCaptureData string `json:"original_capture_data"`
	CaptureHistory []string `json:"capture_history"`
	TotalLPs int `json:"total_lps"`
	NumInitialEvents int `json:"number_of_initial_events"`
	EventData struct {
		EventFile string `json:"file_name"`
		FileFormat []string `json:"format"`
		NumEvents int `json:"total_events"`
	} `json:"event_data"`
	DateAnalyzed string `json:"date_analyzed"`
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func GetTime() string {
	return time.Now().Format(time.RFC850)
}

func ParseJSON(file string) (DesTraceData, [4]int) {
	TraceDataFile, err := os.Open(file)
	check(err)
	defer TraceDataFile.Close()

	fmt.Println("%v: Processing input JSON file: %v", GetTime(), file)

	json := json.NewDecoder(TraceDataFile)

	var TraceData DesTraceData
	err = json.Decode(&TraceData)
	check(err)

	TraceData.DateAnalyzed = ""
	TraceData.NumInitialEvents = 0
	
	if TraceData.TotalLPs <= 0 {
		TraceData.TotalLPs = -1
	}

	if TraceData.NumInitialEvents <= 0 {
		TraceData.NumInitialEvents = -1
	}

	EventDataOrder := [4]int{-1, -1, -1, -1}
	for i, entry := range TraceData.EventData.FileFormat {
		switch entry {
		case "sLP":
			EventDataOrder[0] = i
		
		case "sTS":
			EventDataOrder[1] = i
		
		case "rLP":
			EventDataOrder[2] = i
		
		case "rTS":
			EventDataOrder[3] = i
		}
	}

	DataNames := [4]string{"sLP", "sTS", "rLP", "rTS"}
	for i, entry := range EventDataOrder {
		if entry == -1 {
			log.Fatal("Missing critical field in event data -> format of model JSON file: %v", DataNames[i])
		}
	}

	return TraceData, EventDataOrder
}
package desmetrics

import (
	"testing"
	// "github.com/spkane31/desmetrics/vendor/"
)

func TestParseJSON(t *testing.T) {
	_, EventOrder := ParseJSON("../desmetrics/modelSummary.json")
	expected_events := []int{0, 2, 1, 3}
	for i, event := range EventOrder {
		if event != expected_events[i] {
			t.Errorf("Events[%d] == %v, want %q", i, event, expected_events[i])
		}
	}
}
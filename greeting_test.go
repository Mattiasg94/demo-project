package main

import "testing"

// TestGreetingsCount pins how many greetings Greetings returns. Appending a line
// to greeting.go breaks this until the expected count is bumped to match — the
// small, self-contained code-and-test loop the agent runs.
func TestGreetingsCount(t *testing.T) {
	const want = 1
	if got := len(Greetings()); got != want {
		t.Fatalf("len(Greetings()) = %d; want %d", got, want)
	}
}

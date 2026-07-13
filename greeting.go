package main

// Greetings returns the list of greeting lines.
//
// This is the fixture the agent edits: the task appends a new element here, and
// every append must be matched by the count assertion in greeting_test.go — so
// a code edit deliberately breaks a test the agent then has to fix.
func Greetings() []string {
	return []string{
		"hello",
		"ran at 2026-07-13 17:47:43Z",
		"ran at 2026-07-13 18:18:13Z",
	}
}

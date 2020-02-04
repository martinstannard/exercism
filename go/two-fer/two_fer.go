// Package twofer provides a solution to the two_fer exercism exercise.
package twofer

import "fmt"

// ShareWith takes an optional name and returns an interpolated string.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}

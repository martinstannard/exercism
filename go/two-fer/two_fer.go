/*
Solution for exercism Go track - two_fer
*/
package twofer

import "fmt"

// takes an optional name and returns an interpolated string
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}

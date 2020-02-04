// Package hamming is a solution to the exercism Go track exercise.
package hamming

import "errors"

// Distance calculates the hamming distance between 2 strings or returns an error if strings are not of equal length.
func Distance(a, b string) (int, error) {
	if len(a) == len(b) {
		return calcDistance(a, b), nil
	}
	return 0, errors.New("strings are of unequal length")
}

// calcDistance returns the hamming difference between 2 strings of equal length.
func calcDistance(a, b string) int {
	var count = 0
	for i := range a {
		if a[i] != b[i] {
			count++
		}
	}
	return count
}

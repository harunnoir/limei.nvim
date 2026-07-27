// SPDX-License-Identifier: GPL-2.0-or-later
package main

import (
	"fmt"
	"regexp"
)

const defaultLimit = 42

type Worker struct {
	Name   string
	Active bool
}

func (worker Worker) Run(items []string) int {
	pattern := regexp.MustCompile(`^task:\d+$`)
	count := 0
	for _, item := range items {
		if worker.Active && pattern.MatchString(item) {
			count++
		}
	}
	return count
}

func main() {
	fmt.Println(Worker{Name: "limei", Active: true}.Run([]string{"task:1"}))
}

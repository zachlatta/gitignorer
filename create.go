package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

var cmdCreate = &Command{
	UsageLine: "create [languages]",
	Short:     "create a .gitignore file",
	Long: `
  Create downloads the gitignore templates for the languages specified from
  https://github.com/github/gitignore and mashes them together into a .gitignore
  file.

  Example usage:

  gitignorer create go

  `,
}

func init() {
	cmdCreate.Run = runCreate
}

func runCreate(cmd *Command, args []string) {
	if _, err := os.Stat(".gitignore"); err == nil {
		fmt.Println("Error: A .gitignore file already exists.")
		os.Exit(2)
	}

	var fileContents string
	for _, v := range args {
		fmt.Println("Fetching template for " + v + "...")
		gitignore, _, err := client.Gitignores.Get(v)
		if err != nil {
			fmt.Println(err)
			return
		}

		header := header(v)
		fileContents += header + "\n\n" + *gitignore.Source + "\n\n"
	}

	fileContents = strings.TrimSpace(fileContents)

	fmt.Println("Writing .gitignore file...")
	err := ioutil.WriteFile(".gitignore", []byte(fileContents), 0644)
	if err != nil {
		fmt.Println("Error writing .gitignore file!")
		os.Exit(2)
	}
	fmt.Println("Done!")
}

// Returns something akin to the following:
//
// ##########
// #   Go   #
// ##########
func header(name string) string {
	line := strings.Repeat("#", len(name)+8)
	mid := "#   " + name + "   #"
	return line + "\n" + mid + "\n" + line
}

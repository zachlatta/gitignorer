package main

import (
	"fmt"
	"github.com/zachlatta/go-github/github"
	"io/ioutil"
	"os"
	"strings"
)

var usage = `Gitignorer makes creating .gitignore files easy.

Usage:

  gitignorer command [arguments]

The commands are:

  create    create a .gitignore file
  list      list the available templates
`

var client = github.NewClient(nil)

func main() {
	args := os.Args

	if len(args) <= 1 {
		fmt.Println(usage)
		return
	}

	switch args[1] {
	case "create":
		create(args[2:])
	case "list":
		list()
	default:
		fmt.Println(usage)
	}
}

func create(templates []string) {
	if _, err := os.Stat(".gitignore"); err == nil {
		fmt.Println("Error: A .gitignore file already exists.")
	} else {
		var fileContents string
		for _, v := range templates {
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
		}
		fmt.Println("Done!")
	}
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

func list() {
	templates, _, err := client.Gitignores.List()
	if err != nil {
		fmt.Println(err)
		return
	}

	for _, t := range *templates {
		fmt.Println(t)
	}
}

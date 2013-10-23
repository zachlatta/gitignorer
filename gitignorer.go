package main

import (
	"fmt"
	"github.com/zachlatta/go-github/github"
	"io/ioutil"
	"os"
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
			gitignore, _, err := client.Gitignores.Get(v)
			if err != nil {
				fmt.Println(err)
				return
			}

			fileContents += *gitignore.Source
		}

		err := ioutil.WriteFile(".gitignore", []byte(fileContents), 0644)
		if err != nil {
			fmt.Println("Error writing .gitignore file!")
		}
	}
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

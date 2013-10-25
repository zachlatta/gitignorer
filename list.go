package main

import "fmt"

var cmdList = &Command{
	UsageLine: "list",
	Short:     "list all of the available .gitignore templates",
	Long: `
Lists all of the available .gitignore templates from
https://github.com/github/gitignore.

Example usage:

gitignorer list

`,
}

func init() {
	cmdList.Run = runList
}

func runList(cmd *Command, args []string) {
	templates, _, err := client.Gitignores.List()
	if err != nil {
		fmt.Println(err)
		return
	}

	for _, t := range *templates {
		fmt.Println(t)
	}
}

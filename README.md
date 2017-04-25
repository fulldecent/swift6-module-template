[![Build Status](https://travis-ci.org/fulldecent/swift3-module-template.svg?branch=master)](https://travis-ci.org/fulldecent/swift3-module-template)

# Swift 3 Module Template
Use this template as a starting point for any Swift 3 module that you want other people to include in their projects.

**For Objective-C projects, see [objective-c-module-template](https://github.com/fulldecent/objective-c-module-template).**

**STATUS: This template is ready to work in production code.**

![Swift 3 Module directory layout](https://cloud.githubusercontent.com/assets/382183/18574753/43dda33e-7b9e-11e6-9e91-cf91c4a03ccd.png)

## Features
Your new Swift 3 module will immediately have working, compilable code, and all these features:

-   Ability to be used from Swift Package Manager, CocoaPods and Carthage
-   Clean folder structure
-   MIT license
-   Testing as a standard
-   Turnkey access to Travis CI
-   Semantic versioning and a CHANGELOG

## How to use this

Clone or [download a release](https://github.com/fulldecent/swift-package/releases) and run the  `./configure` program. It will ask you some questions and generate a project.

You then add all the interesting features you want your module to have.

### Using CocoaPods to manage dependencies for your example app

You distribute an example app with your new Swift module to show that it works. You may also decide to add UI tests to your example app and some people like to use testing frameworks for those UI tests. If you would like to use CocoaPods to manage the dependencies of your example app, please see the discussion at https://github.com/fulldecent/swift3-module-template/issues/8.

### Setting up pre-defined answers

You can set up pre-defined answers (e.&nbsp;g. for scripting) in the following ways:

| Template variable | Ways to pre-define the variable | Example |
| ----------------- | ------------------------------- | ------- |
| **`__PROJECT_NAME__`** | To pre-define an answer, **pass your project name** to the `./configure` program as a single command-line parameter.<br/>Alternatively, you can use the **`SMT_PROJECT_NAME`** environment variable. | `./configure MyFantasticProject` |
| **`__ORGANIZATION NAME__`** | To pre-define an answer, define an environment variable named **`SMT_ORGANIZATION_NAME`**. | `export SMT_ORGANIZATION_NAME='Awesome Org'` |
| **`com.AN.ORGANIZATION.IDENTIFIER`** | To pre-define an answer, define an environment variable named **`SMT_COM_AN_ORGANIZATION_IDENTIFIER`**. | `export SMT_COM_AN_ORGANIZATION_IDENTIFIER='com.awesome'` |
| **`__AUTHOR NAME__`** | To pre-define an answer, define an environment variable named **`SMT_AUTHOR_NAME`**. | `export SMT_AUTHOR_NAME='Mr McAwesome'` |
| **`__TODAYS_DATE__`** | To pre-define an answer, define an environment variable named **`SMT_TODAYS_DATE`**. | `export SMT_TODAYS_DATE='her birthday'` |
| **`__TODAYS_DATE__`** (date format) | As an alternative to the `SMT_TODAYS_DATE` environment variable, you can use **`SMT_DATE_FORMAT_STRING`** to pre-define a date format. The program will still ask you for today’s date; however, it will use the format provided in this variable. | `export SMT_DATE_FORMAT_STRING='%F'` |
| **`__TODAYS_YEAR__`** | To pre-define an answer, define an environment variable named **`SMT_TODAYS_YEAR`**. | `export SMT_TODAYS_YEAR='2077'` |
| **`__GITHUB_USERNAME__`** | To pre-define an answer, define an environment variable named **`SMT_GITHUB_USERNAME`**. | `export SMT_GITHUB_USERNAME='awesome_octocat'` |

If an answer is pre-defined, the `./configure` program will use it; otherwise, it will ask for an answer interactively. If neither is given, it will fall back to the built-in default values.

## Contributing

See the file [`Recipe.md`](Recipe.md) for the complete steps (e.g. Open Xcode, make new project, click here, type that, ...) of how we made the template.

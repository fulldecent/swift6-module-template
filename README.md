[![Build Status](https://travis-ci.org/fulldecent/swift5-module-template.svg?branch=master)](https://travis-ci.org/fulldecent/swift5-module-template)

# Swift 5 Module Template
Use this template as a starting point for any Swift 5 module that you want other people to include in their projects.

**STATUS: This template is ready and works in production code, compatible with Xcode 13.1 (13A1030d)**

![Swift 5 Module directory layout](https://user-images.githubusercontent.com/382183/66881876-63cca680-ef96-11e9-9dde-ae9d5c35350c.png)

## Features
Your new Swift 5 module will immediately have working, compilable code, and all these features:

-   Ability to be used from Swift Package Manager, CocoaPods and Carthage
-   Clean folder structure
-   MIT license
-   Testing as a standard
-   Turnkey access to GitHub Actions testing
-   Semantic versioning and a CHANGELOG
-   Included example/demo app using SwiftUI

We make the assumption you are using an Xcode project to manage your code.

## How to use this

Clone or [download a release](https://github.com/fulldecent/swift5-module-template/releases) and run the  `./configure` program. It will ask you some questions and generate a project.

Or if you have CocoaPods installed, you can alternatively use:

```sh
pod lib create --verbose --template-url='https://github.com/fulldecent/swift5-module-template.git' MyNewPodName
```

You then add all the interesting features you want your module to have.

### Using CocoaPods to manage dependencies for your example app

You distribute an example app with your new Swift module to show that it works. You may also decide to add UI tests to your example app and some people like to use testing frameworks for those UI tests. If you would like to use CocoaPods to manage the dependencies of your example app, please see the discussion at https://github.com/fulldecent/swift5-module-template/issues/8.

### Automating the configure script

To skip interactive prompts in the `./configure` script, use these environment variables:

| Template variable                | Environment variable                     |
| -------------------------------- | ---------------------------------------- |
| `__PROJECT_NAME__`               | `SMT_PROJECT_NAME`                       |
| `__ORGANIZATION NAME__`          | `SMT_ORGANIZATION_NAME`                  |
| `com.AN.ORGANIZATION.IDENTIFIER` | `SMT_COM_AN_ORGANIZATION_IDENTIFIER`     |
| `__AUTHOR NAME__`                | `SMT_AUTHOR_NAME`                        |
| `__TODAYS_DATE__`                | `SMT_TODAYS_DATE`                        |
| `__TODAYS_DATE__` (date format)  | `SMT_DATE_FORMAT_STRING` Note: this will ask you for today’s date but it will use this format in the template. |
| `__TODAYS_YEAR__`                | `SMT_TODAYS_YEAR`                        |
| `__GITHUB_USERNAME__`            | `SMT_GITHUB_USERNAME`                    |

For example, you may use: `export SMT_ORGANIZATION_NAME='Awesome Org'` before running `./configure`.

## How it works

```
┌─────────────┐              ┌─────────────┐              ┌─────────────┐
│     Use     │              │    Save     │              │Use your own │
│    Xcode    │─Save recipe─▶│  template   │─./configure─▶│   module    │
└─────────────┘              └─────────────┘              └─────────────┘
       ▲              ▲             ▲               ▲            ▲       
                                                                         
       │              │             │               │            │       
        Contributors to this project          End users of this project
```

## Contributing

See the file [Recipe.md](Recipe.md) for the complete steps (e.g. Open Xcode, make new project, click here, type that, …) of how we made the template.

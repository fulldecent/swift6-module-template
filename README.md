[![Build Status](https://travis-ci.org/fulldecent/swift3-module-template.svg?branch=master)](https://travis-ci.org/fulldecent/swift3-module-template)

# Swift 3 Module Template
Use this template as a starting point for any Swift 3 module that you want other people to include in their projects.

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

## Contributing

See the file [`Recipe.md`](Recipe.md) for the complete steps (e.g. Open Xcode, make new project, click here, type that, ...) of how we made the template.

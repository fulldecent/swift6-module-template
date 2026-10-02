# Swift6-module-template
[![Test](https://github.com/__GITHUB_USERNAME__/xxPROJECTxNAMExx/actions/workflows/swiftlang-workflows.yml/badge.svg?branch=main)](https://github.com/__GITHUB_USERNAME__/xxPROJECTxNAMExx/actions/workflows/swiftlang-workflows.yml)

> [!IMPORTANT]
>
> Use `swift TEMPLATE/configure.swift` to interactively your own project name and other details to this template.
>
> Alternatively, use the [RECIPE](TEMPLATE/RECIPE.md) for a walkthrough of starting with "Open Xcode" and ending with the exact contents of this repo.
>
> Replace this top heading with your own project name and status badge, and replace the rest of this section with what the project does, and show it (e.g. with screenshots).
>

This is an opinionated template for every Swift module, that provides:

- An explicit license (MIT, at [LICENSE](https://github.com/fulldecent/project-template/blob/main/LICENSE))
- A [.gitignore](https://github.com/fulldecent/project-template/blob/main/.gitignore) with modern defaults
- Continuous integration to [perform testing](.github/swiftlang-workflows.yml)
- An example app that is wired to the Swift module

![Swift 6 directory layout](https://github.com/fulldecent/swift6-module-template/assets/382183/1a7965f0-af84-4d00-9bb6-97db76e6e715)

## What this project does

xxPROJECTxNAMExx is a reusable Swift 6 module. It provides:

- A Swift Package Manager library and tests
- An example SwiftUI app in an Xcode project
- Semantic versioning, a [CHANGELOG](CHANGELOG.md), and an MIT license
- GitHub Actions testing with the workflows published for Swift packages
- [EditorConfig](.editorconfig), a [.gitignore](.gitignore), and [enforced formatting](.github/workflows/lint.yml)

The example app shows a white king (♔).

## Example

Clone the repo and open [Example/Example.xcodeproj](Example/Example.xcodeproj). Run the Example scheme on a recent iPhone simulator.

## Installation

Add this package with Swift Package Manager. In Xcode that is File > Add Package Dependencies...

## Development

Format the files the lint workflow checks. These commands use `npx` at `@latest` so the local write matches [.github/workflows/lint.yml](.github/workflows/lint.yml). A pinned package would let the local write and the CI check disagree.

```sh
npx prettier@latest --write .
npx markdownlint-cli@latest --fix "**/*.md" --ignore node_modules
```

### Testing

Run the test suite with:

```sh
xcrun swift test
```

## Maintenance and dependency updates

Do this every quarter or so and please send a PR here if you see updates available:

1. Identify external Actions in [.github/workflows](./.github/workflows) scripts and look for available new versions. Review and then update to the new version if it is safe. GitHub-supported Actions (i.e. under the actions/ organization) may require only cursory review.
1. Review the Swift versions excluded in [.github/workflows/swiftlang-workflows.yml](.github/workflows/swiftlang-workflows.yml).
1. Review the [RECIPE](TEMPLATE/RECIPE.md) and confirm that the current latest pubished version of Xcode equals the version asserted at the top of this file. If not, redo the recipe.

## References

> [!IMPORTANT]
>
> We use an MIT license for this template. You should carefully consider which license to apply to your own project.
>
> If your project materially relied on external sources to make some decisions, cite them here.
>
> We cite a text formatting policy below. This applies to our README above as well as our workflow rules and other configuration files. If you have a different policy, then please implement it throughout.

1. We use title case for titles and proper nouns; not for headings and things. This includes our README above as well as our workflow rules and other configuration files. If you have a different policy, then please implement it throughout.
1. We use an MIT license for this template. You should carefully consider which license to apply to your own project.
1. Swift ignore rules are inlined from [Swift.gitignore](https://github.com/github/gitignore/blob/main/Swift.gitignore). The macOS and secret rules above them come from [project-template](https://github.com/fulldecent/project-template).
1. This project is built based on [best practices documented in Swift 6 Module Template](https://github.com/fulldecent/swift6-module-template).
1. This project is built based on [best practices documented in project-template](https://github.com/fulldecent/project-template), release 1.0.0.

# White Pawn

> [!TIP]
> This template is a starting point you can use for every Swift module. We offer:
>
> - A Swift package, tests, and an example app
> - Continuous integration with the [Swift package workflows](.github/workflows/swiftlang-workflows.yml)
> - Automated releases with [Release Please](.github/workflows/release.yml) and SLSA provenance attestation
> - An MIT license and a [.gitignore](.gitignore)
>
> Run `swift TEMPLATE/configure.swift` to fill in the project name and the other placeholders. [TEMPLATE/Recipe.md](TEMPLATE/Recipe.md) walks through the same result starting from Xcode.
>
> What is in-scope for this template?
>
> We the people who publish reusable Swift modules, in order to hand every module a tested package, an example app, and a release, maintain this starting point.
>
> Swift 6 Module Template must remain broad—addressing many kinds of modules. Every module deserves a README, an example, and a clear rule on formatting, this is why we include continuous integration.
>
> We do not specify that GitHub and GitHub Actions are the only way to host projects, others may consider our GitHub-specific notes as a starting point guide for implementing outside of GitHub.
>
> And now below is the template, shown for a specific hypothetical project, enjoy!

[![Test](https://github.com/fulldecent/swift6-module-template/actions/workflows/swiftlang-workflows.yml/badge.svg)](https://github.com/fulldecent/swift6-module-template/actions/workflows/swiftlang-workflows.yml)

White Pawn shows a white chess pawn (♙).

![Swift 6 directory layout](https://github.com/fulldecent/swift6-module-template/assets/382183/1a7965f0-af84-4d00-9bb6-97db76e6e715)

> [!NOTE]
> Replace the project name, description, demonstration and badge URLs with your own. Show what your project does before asking people to read further.

## What this project does

White Pawn is a reusable Swift 6 module. It provides:

- A Swift Package Manager library and tests
- An example SwiftUI app in an Xcode project
- Semantic versioning, a [CHANGELOG](CHANGELOG.md), and an MIT license
- GitHub Actions testing with the workflows published for Swift packages
- [EditorConfig](.editorconfig), a [.gitignore](.gitignore), and [enforced formatting](.github/workflows/lint.yml)

The example app shows a white pawn (♙).

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

### Releases

Use `fix:`, `feat:` or `BREAKING CHANGE:` in your commit messages. This triggers our bot to make a release draft pull request. Merging that pull request triggers a new tag and GitHub Release.

The [release workflow](.github/workflows/release.yml) uses [Release Please](https://github.com/googleapis/release-please) with the `simple` release type. [`.release-please-manifest.json`](.release-please-manifest.json) is the last released version. Release Please writes [CHANGELOG.md](CHANGELOG.md) on the release pull request. Commit messages follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

[Build and test](.github/workflows/build-test.yml) builds and tests a release-mode Linux library, then attests and uploads it. The release includes that library and `release.sigstore.jsonl`, containing build provenance and version attestations. The published library is for Linux. Swift Package Manager uses the git tag.

> [!NOTE]
> In your GitHub repository settings, under Actions, General, Workflow permissions, select read and write permissions and check "Allow GitHub Actions to create and approve pull requests". Under General, Releases, enable release immutability. Attestations are available for public repositories; private repositories require GitHub Enterprise Cloud.
>
> A repository created from this template should set [`.release-please-manifest.json`](.release-please-manifest.json) to `0.0.0`. This repository's manifest is `16.5.0`, the same version as tag [v16.5.0](https://github.com/fulldecent/swift6-module-template/releases/tag/v16.5.0). Release Please needs a SemVer version to bump.

## Maintenance and dependency updates

Do this every quarter or so and please send a PR here if you see updates available:

1. Identify external Actions in [.github/workflows](./.github/workflows) scripts and look for available new versions. Review and then update to the new version if it is safe. GitHub-supported Actions (i.e. under the actions/ organization) may require only cursory review.
1. Review the Swift versions in [.github/workflows/swiftlang-workflows.yml](.github/workflows/swiftlang-workflows.yml). The package requires the tools version in [Package.swift](Package.swift).
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
1. Releases follow the [project-template release workflow](https://github.com/fulldecent/project-template/blob/v1.3.0/.github/workflows/release.yml), release 1.3.0. The published file is the Linux static library from `swift build -c release`. project-template publishes `README.md` there, and [rust-template](https://github.com/fulldecent/rust-template) publishes its command-line binary.

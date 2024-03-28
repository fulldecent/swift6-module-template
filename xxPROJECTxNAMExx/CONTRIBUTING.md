# Contributing

All contributors are welcome. Please use issues and pull requests to contribute to the project. And update [CHANGELOG.md](CHANGELOG.md) when committing.

## Making a change

When you commit a change, please add a note to [CHANGELOG.md](CHANGELOG.md).

## Release process

1. Confirm the build is [passing in GitHub Actions](https://github.com/__GITHUB_USERNAME__/xxPROJECTxNAMExx/actions)
2. Push a release commit
   1. Create a new Main section at the top
   2. Rename the old Main section like:
          ## [1.0.5](https://github.com/__GITHUB_USERNAME__/xxPROJECTxNAMExx/releases/tag/1.0.5)
          Released on 2019-10-15.
3. Create a GitHub release
   1. Tag the release (like `1.0.5`)
   2. Paste notes from [CHANGELOG.md](CHANGELOG.md)
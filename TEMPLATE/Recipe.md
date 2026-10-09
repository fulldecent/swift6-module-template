# Recipe

This recipe cites all best practices we follow and documents exactly how we created Swift 6 Module Template.

Please follow along and you should produce a template that is identical to the one we provided. If this recipe is not perfect (or your result is different from our template in any way) then please submit an issue or pull request.

This recipe may also be useful for other scenarios, for example maybe you want to make a project that has the Example app using storyboards instead of SwiftUI.

## Ingredients

During the steps of this recipe we enter specific values where needed. These are chosen carefully so that `TEMPLATE/configure.swift` can later find and replace these values in the repository to create your project.

- `swift6-module-template`
  - Your project template name must not have spaces in it.
  
  - :warning: This is a workaround for a bug introduced in Xcode 27.0 (27A266a) when your Swift project has spaces in its name: "Swift 6 Module Template could not be resolved".

- `swift6_module_template`
  - Use the Xcode C99 slugify process to create this based on the project name above.
  - This must also be a Uniform Target Identifier (``/^[a-zA-Z0-9-.]+$/``).
  - If this contains the characters `-` or `.` then they will be transliterated to `_` for file names.

- `__ORGANIZATION_NAME__`
  - This intentionally has a space which causes Xcode to use double quotes in its project configuration files.

- `com.AN.ORGANIZATION.IDENTIFIER`

- `__AUTHOR_NAME__`
  - This intentionally has a space which causes Xcode to use double quotes in its project configuration files.

- `__TODAYS_DATE__`

- `__TODAYS_YEAR__`

- `__GITHUB_USERNAME__`

## Steps

Open Xcode version 27.0 (27A266a). *This is the latest publicly released version.*

A previous version of this recipe is also demonstrated in a YouTube flyover at <https://youtu.be/ksYXtNn8lhE> (15 minutes).

### I. Create a package for your module

1. In Xcode, choose File > New > Project... > Package…
   1. Choose Multiplatform > Library > Library, and click "Next".
   2. For testing system, select Swift Testing, and click "Next".
   3. Navigate to your Desktop folder.
   4. Type the name `swift6-module-template`.
   5. Ensure "Create Git repository on my Mac" is unchecked.
   6. Click “Create".

### II. Add some functionality to your module

1. Use Terminal.app to insert some files into the project

   ```sh
   cd ~/Desktop/swift6-module-template/Sources/swift6_module_template
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/xxPROJECTxNAMExx.swift' -o swift6_module_template.swift
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/White%20King.swift' -o White\ King.swift
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/refs/heads/main/xxPROJECTxNAMExx/Tests/xxPROJECTxNAMExxTests/xxPROJECTxNAMExxTests.swift' -o ../../Tests/swift6_module_templateTests/swift6_module_templateTests.swift
   ```

### III. Create a Swift project for your Example application

1. In Xcode, choose File > New > Project…. > App
2. Choose File > Save Project...
   1. Ensure "Create Git repository on my Mac" is not selected.
   2. Ensure "Automatic" is selected.
   3. Set the Save As name to `Example`.
   4. Select the folder `swift6-module-template` on the desktop (don't double click it).
   5. Click “Save".


### IV. Make your example application depend on your module

1. Close the swift6-module-template project in Xcode. (Xcode will not compile the Example if the module is also open.)
2. Open Example.xcodeproj in Xcode
3. In Xcode, choose File > Add Package Dependencies...
   1. Click "Add Local..."
   2. Select the folder `swift6-module-template` on the desktop (don't double click it)
   3. Click "Add Package"

### V. Add some functionality to your Example application

1. Use Terminal.app to insert some files into the project

   ```sh
   cd ~/Desktop/swift6-module-template/Example/Example
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/Example/Sources/ContentView.swift' -o ContentView.swift
   ```

### VI. Add additional project management files to the module

*These files represent best practices which every open source Swift module author should adopt for published code.*

1. Use Terminal.app to add additional files to the project

   ```sh
   cd ~/Desktop/swift6-module-template
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/.gitignore' -o .gitignore
   mkdir -p .github/workflows
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/.github/workflows/swiftlang-workflows.yml' -o .github/workflows/swiftlang-workflows.yml
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/LICENSE' -o LICENSE
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/README.md' -o README.md
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/CONTRIBUTING.md' -o CONTRIBUTING.md
   ```

### VII. Remove identifying parts of your project

*This step allows everybody to achieve byte-for-byte consistency with [the published Swift 6 Module Template](https://github.com/fulldecent/swift6-module-template) but otherwise provides no value to you.*

1. Use Terminal.app to find and replace all occurrences of hard-coded strings with template variables

   ```sh
   find -E ~/Desktop/swift6-module-template \
           -type f -name '*.swift' -exec sed -i '' -E -e '
             s-(// +Created by ).*( on ).*\.-\1__AUTHOR_NAME__\2__TODAYS_DATE__.-
             s-(// +Copyright © ).*-\1__TODAYS_YEAR__ __ORGANIZATION_NAME__. All rights reserved.-' \
             '{}' \;
   ```

## Taste testing

1. Open Example.xcodeproj in Xcode

2. Use the scheme navigator to select Example and the latest iPhone version simulator

3. Choose Product > Run
   :white_check_mark: You should see a big white king (♔) after a few moments. That means it worked!

4. *Compare with the distributed Swift 6 Module Template repository*

   1. Use Terminal.app to clone the repository to your Developer folder

       ```sh
       git clone https://github.com/fulldecent/swift6-module-template.git ~/Developer/swift6-module-template
       ```

   2. Compare the distributed version with your version

       ```sh
       diff -rq --exclude='.git' --exclude='TEMPLATE' ~/Developer/swift6-module-template ~/Desktop/swift6-module-template
       ```
   
       - :white_check_mark: You should see an empty screen indicating no differences (press `q` to close)
       - :mega: If you see differences, please raise an issue in the project repository

# Recipe

This recipe documents exactly how we created the Swift 5 Module Template. Please follow along and you should create a template that is identical to the one we provided. If this recipe is not perfect (or your result is different from our template in any way) then please submit an issue or pull request.

This recipe may also be useful for other scenarios, for example maybe you want to make a project that has the iOS example app using storyboards instead of SwiftUI.


## Ingredients

During the steps of this recipe we enter specific values where needed. These are chosen carefully so that the `./configure` script can later find and replace these values in the template to create your project.

Some variables have spaces in them. That is intentional because Xcode only uses robust quoting in its project configuration files (which we want) if the variables have spaces in them.

-   `xxPROJECTxNAMExx`
    -   This must be a valid C99 extended identifier (otherwise the Xcode check dependencies step fails). It cannot contain spaces.
    -   This must also be a Uniform Target Identifier (``/^[a-zA-Z0-9-.]+$/``).
    -   If this contains the characters `-` or `.` then they will be transliterated to `_` for file names.

-   `__ORGANIZATION NAME__`
    -   This intentionally has a space which causes Xcode to use double quotes in its project configuration files.
    
-   `com.AN.ORGANIZATION.IDENTIFIER`

-   `__AUTHOR NAME__`
    -   This intentionally has a space which causes Xcode to use double quotes in its project configuration files.

-   `__TODAYS_DATE__`

-   `__TODAYS_YEAR__`

-   `__GITHUB_USERNAME__`


## Steps

Complete all these instructions on the same calendar day.

Use Xcode Version 13.1 (13A1030d). *This is the latest publicly released or Gold Master version.*

This recipe is also demonstrated in a YouTube flyover at https://youtu.be/ksYXtNn8lhE (15 minutes).

### I. Create a package for your module

1. In Xcode, choose File > New > Package…
   1. Navigate to your Desktop folder
   2. Type the name `xxPROJECTxNAMExx`
   3. Ensure "Create Git repository on my Mac" is unchecked
   4. Click “Create"


### II. Add some functionality to the module

1. Use Terminal.app to insert some files into the project

   ```sh
   cd ~/Desktop/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/
   curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/xxPROJECTxNAMExx.swift' -o xxPROJECTxNAMExx.swift
   curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/White%20King.swift' -o White\ King.swift
   ```

### III. Create a Swift project for your iOS Example application

1. In Xcode, choose File > New > Project…
   1. *Choose a template*
      1. Click "iOS" then "App"

      2. Click "Next"

   2. *Set the project options*
      1. Set Product Name to "iOS Example"
      2. Set Team to "None"
      3. Set Organization Identifier to `com.AN.ORGANIZATION.IDENTIFIER`
      4. Set User Interface to "SwiftUI"
      5. Set Language to "Swift"
      7. Ensure “Use Core Data” and "Include Tests" are not selected
      8. Click “Next"
   3. *Create the project*
      1. Ensure “Create Git Repository on my Mac" is not selected
      2. Ensure "Add to" is “Don’t add to any project or workspace"
      3. Select the folder `xxPROJECTxNAMExx` on the desktop (don't double click it)
      4. Click “Create"

### IV. Use the directory layout structure like Alamofire

1. *Move iOS Example source code to a folder named "Sources"*
   1. Open the file iOS Example.xcodeproj in Xcode
   2. Show the Project navigator on the left (folder icon)
   3. Use the Project navigator to select the "iOS Example" folder (gray icon)
   4. From the Project navigator, rename this folder as "Sources"
      * :information_source: The Alamofire project uses [the folder name "Source"](https://github.com/Alamofire/Alamofire/tree/master/Example/Source) but we choose "Sources" here to be consistent with [the default of Swift Package Manager](https://github.com/apple/swift-package-manager/blob/4fd4df4275627ebc91a0f288c38658738cd9fa0f/Sources/Workspace/InitPackage.swift#L275)
2. *Fix the Info.plist file configuration and preview content folder (Xcode makes renaming folders a pain)*
   1. Click "iOS Example" on the left (the blue icon)
   2. Click the target "iOS Example" in the middle (white app icon)
   3. Click "Build Settings" on the top of the middle
   6. Enter "Development Assets" in the search box
   7. In the "Deployment" section, edit the value from “iOS Example/Preview Content” to "Sources/Preview Content"

### V. Add some functionality to your iOS Example application

1. Use Terminal.app to insert some files into the project

   ```sh
   cd ~/Desktop/xxPROJECTxNAMExx/iOS\ Example/Sources
   curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/iOS%20Example/Sources/ContentView.swift' -o ContentView.swift
   ```

### VI. Make your iOS Example application depend on your module

1. Open iOS Example.xcodeproj in Xcode
2. In Xcode, choose File > Add Packages...
   1. Click "Add Local..."
   2. Select the `xxPROJECTxNAMExx` folder on your desktop
   3. Click "Add Package"

3. *Add a build dependency*
   1. :information_source: You may or may not need to quit and reopen Xcode to proceed and see the required library, this is a known Xcode issue
   1. Click "iOS Example" on the left (the blue icon)
   1. Click the target "iOS Example" in the middle (white app icon)
   1. Click "Build Phases" on the top
   1. Open the section Link Binary With Libraries
   1. Click the plus (+) button
   1. Select `xxPROJECTxNAMExx` (the building icon)
   1. Click "Add"

### VII. Add additional project management files to the module

*These files represent best practices which every Swift module author should adopt for published code.*

1. Use Terminal.app to add additional files to the project

    ```sh
    cd ~/Desktop/xxPROJECTxNAMExx/
    curl 'https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore' -o .gitignore
    mkdir -p .github/workflows
    curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/.github/workflows/ci.yml' -o .github/workflows/ci.yml
    curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/LICENSE' -o LICENSE
    curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/README.md' -o README.md
    curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/CHANGELOG.md' -o CHANGELOG.md
    curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/CONTRIBUTING.md' -o CONTRIBUTING.md
    echo 'xxPROJECTxNAMExx.framework.zip' >> .gitignore
    curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/xxPROJECTxNAMExx/Tests/CheckCocoaPodsQualityIndexes.rb' -o Tests/CheckCocoaPodsQualityIndexes.rb
    ```
### VIII. Remove identifying parts of your project

*This step allows everybody to achieve byte-for-byte consistency with [the published Swift 5 Module Template](https://github.com/fulldecent/swift5-module-template/tree/master/xxPROJECTxNAMExx) but otherwise provides no value to you.*

1. Use Terminal.app to find and replace all occurrences of hard-coded strings with template variables

   ```sh
   find -E ~/Desktop/xxPROJECTxNAMExx \
           -regex '.*\.(h|swift)' -exec sed -i '' -E -e '
             s-(// +Created by ).*( on ).*\.-\1__AUTHOR NAME__\2__TODAYS_DATE__.-
             s-(// +Copyright © ).*-\1__TODAYS_YEAR__ __ORGANIZATION NAME__. All rights reserved.-' \
             '{}' \;
   ```

## Taste testing

1. Open iOS Example.xcworkspace in Xcode

2. Use the scheme navigator to select iOS Example and the latest iPhone version

3. Choose Product > Run

   * :white_check_mark: You should see a big white king (♔) after a few moments. That means it worked!
   
4. *Compare with the distributed Swift 5 Module Template repository*

   1.  Use Terminal.app to clone the repository to your desktop

       ```sh
       git clone https://github.com/fulldecent/swift5-module-template.git ~/Desktop/swift5-module-template
       ```

   2.  Compare the distributed version with your version

       ```sh
       cd ~/Desktop/swift5-module-template
       rm -rf xxPROJECTxNAMExx
       cp -r ~/Desktop/xxPROJECTxNAMExx .
       git diff
       ```

       * :white_check_mark: You should see an empty screen indicating no differences (press <kbd>q</kbd> to close)
       * :mega: If you see differences, please raise an issue in the project repository


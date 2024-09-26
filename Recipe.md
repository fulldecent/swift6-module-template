# Recipe

This recipe cites all best practices we follow and documents exactly how we created the Swift 6 Module Template which is the [xxPROJECTxNAMExx folder](./xxPROJECTxNAMExx) in this repo.

Please follow along and you should create a template that is identical to the one we provided. If this recipe is not perfect (or your result is different from our template in any way) then please submit an issue or pull request.

This recipe may also be useful for other scenarios, for example maybe you want to make a project that has the Example app using storyboards instead of SwiftUI.


## Ingredients

During the steps of this recipe we enter specific values where needed. These are chosen carefully so that the `./configure.rb` script can later find and replace these values in the template to create your project.

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

Use Xcode Version 16.0 (16A242d). *This is the latest publicly released or Gold Master version.*

A previous version of this recipe is also demonstrated in a YouTube flyover at https://youtu.be/ksYXtNn8lhE (15 minutes).

### I. Create a package for your module

1. In Xcode, choose File > New > Package…
   1. Choose Multiplatform > Library > Library, and click "Next"
   2. For testing system, select Swift Testing, and click "Next"
   3. Navigate to your Desktop folder
   4. Type the name `xxPROJECTxNAMExx`
   5. Ensure "Create Git repository on my Mac" is unchecked
   6. Click “Create"


### II. Add some functionality to the module

1. Use Terminal.app to insert some files into the project

   ```sh
   cd ~/Desktop/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/xxPROJECTxNAMExx.swift' -o xxPROJECTxNAMExx.swift
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/Sources/xxPROJECTxNAMExx/White%20King.swift' -o White\ King.swift
   ```

### III. Create a Swift project for your Example application

1. In Xcode, choose File > New > Project…
   1. *Choose a template*
      1. Click iOS > Application > App, and click "Next"
   2. *Set the project options*
      1. Set Product Name to "Example"
      2. Set Team to "None"
      3. Set Organization Identifier to `com.AN.ORGANIZATION.IDENTIFIER`
      4. Set User Interface to "SwiftUI"
      5. Set Language to "Swift"
      6. Set Storage to "None"
      7. Ensure "Include Tests" is not selected
      8. Click “Next"
   3. *Create the project*
      1. Ensure “Create Git Repository on my Mac" is not selected
      2. Ensure "Add to" is “Don’t add to any project or workspace"
      3. Select the folder `xxPROJECTxNAMExx` on the desktop (don't double click it)
      4. Click “Create"

### IV. Use the directory layout structure like Alamofire

1. *Move Example source code to a folder named "Sources"*
   1. Open the file Example.xcodeproj in Xcode
   2. Show the Project navigator on the left (folder icon)
   3. Use the Project navigator to select the "Example" folder (blue icon)
   4. From the Project navigator, rename this folder as "Sources"
      * :information_source: The Alamofire project uses [the folder name "Source"](https://github.com/Alamofire/Alamofire/tree/master/Example/Source) but we choose "Sources" here to be consistent with [the default of Swift Package Manager](https://github.com/swiftlang/swift-package-manager/blob/dd22b6ef16315fcdcb07c1f86bd608598f102e20/Sources/Workspace/InitPackage.swift#L566)
2. *Fix the Info.plist file configuration and preview content folder (Xcode makes renaming folders a pain)*
   1. Click "Example" on the left (the blue app icon)
   2. In the middle area, click the target "Example" (gray app icon)
   3. Click "Build Settings" on the top of the middle
   6. Enter "Development Assets" in the search box
   7. In the "Deployment" section, edit the value from “Example/Preview Content” to "Sources/Preview Content"

### V. Add some functionality to your Example application

1. Use Terminal.app to insert some files into the project

   ```sh
   cd ~/Desktop/xxPROJECTxNAMExx/Example/Sources
   curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/Example/Sources/ContentView.swift' -o ContentView.swift
   ```

### VI. Make your Example application depend on your module

1. Open Example.xcodeproj in Xcode
3. In Xcode, choose File > Add Package Dependencies...
   1. Click "Add Local..."
   2. Select the `xxPROJECTxNAMExx` folder on your desktop
   3. Click "Add Package"
   4. In the choose package products, set the "add to target" to "Example", and click "Add Package"


### VII. Add additional project management files to the module

*These files represent best practices which every Swift module author should adopt for published code.*

1. Use Terminal.app to add additional files to the project

    ```sh
    cd ~/Desktop/xxPROJECTxNAMExx/
    curl 'https://raw.githubusercontent.com/github/gitignore/main/Swift.gitignore' -o .gitignore
    mkdir -p .github/workflows
    curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/.github/workflows/ci.yml' -o .github/workflows/ci.yml
    curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/LICENSE' -o LICENSE
    curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/README.md' -o README.md
    curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/CHANGELOG.md' -o CHANGELOG.md
    curl 'https://raw.githubusercontent.com/fulldecent/swift6-module-template/main/xxPROJECTxNAMExx/CONTRIBUTING.md' -o CONTRIBUTING.md
    ```

### VIII. Remove identifying parts of your project

*This step allows everybody to achieve byte-for-byte consistency with [the published Swift 6 Module Template](https://github.com/fulldecent/swift5-module-template/tree/main/xxPROJECTxNAMExx) but otherwise provides no value to you.*

1. Use Terminal.app to find and replace all occurrences of hard-coded strings with template variables

   ```sh
   find -E ~/Desktop/xxPROJECTxNAMExx \
           -type f -name '*.swift' -exec sed -i '' -E -e '
             s-(// +Created by ).*( on ).*\.-\1__AUTHOR NAME__\2__TODAYS_DATE__.-
             s-(// +Copyright © ).*-\1__TODAYS_YEAR__ __ORGANIZATION NAME__. All rights reserved.-' \
             '{}' \;
   ```

## Taste testing

1. Open Example.xcodeproj in Xcode

2. Use the scheme navigator to select Example and the latest iPhone version simulator

3. Choose Product > Run

   * :white_check_mark: You should see a big white king (♔) after a few moments. That means it worked!
   
4. *Compare with the distributed Swift 6 Module Template repository*

   1.  Use Terminal.app to clone the repository to your Developer folder

       ```sh
       git clone https://github.com/fulldecent/swift6-module-template.git ~/Developer/swift6-module-template
       ```

   2.  Compare the distributed version with your version

       ```sh
       cd ~/Developer/swift6-module-template
       rm -rf xxPROJECTxNAMExx
       cp -r ~/Desktop/xxPROJECTxNAMExx .
       git diff
       ```

       * :white_check_mark: You should see an empty screen indicating no differences (press <kbd>q</kbd> to close)
       * :mega: If you see differences, please raise an issue in the project repository


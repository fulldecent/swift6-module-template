# Recipe

This recipe documents exactly how we created the template. Please follow along and you should create a template that is identical to the one we provided. If this recipe is not perfect, or your result from following the recipe is different from our template, then please submit an [issue](https://github.com/fulldecent/swift5-module-template/issues/new) or [pull request](https://github.com/fulldecent/swift4-module-template/pulls).


## Ingredients

During the steps of this recipe we enter specific values where needed. These are chosen carefully so that they can be found and replaced in the template to create your project.

Some variables have spaces in them. That is intentional because it causes Xcode to use double quotes around them in its project configuration files.

-   `__PROJECT_NAME__`

    -   This must be a valid C99 extended identifier (otherwise the Xcode check dependencies step fails). It cannot contain spaces.

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

1. Open Xcode Version 10.2 (10E125), which is the latest publicly released or Gold Master version

2. Create a project for your module

    1. Click “Create a new Xcode project"

    2. Configure the template for a Swift module

        1.  Click “iOS"

        2.  Select "Cocoa Touch Framework"

        3.  Click “Next"

    3. Set the project options

        1.  Set product name to `__PROJECT_NAME__`

        2.  Set organization name to `__ORGANIZATION NAME__`

        3.  Set organization identifier to `com.AN.ORGANIZATION.IDENTIFIER`

        4.  Set language to "Swift"

        5.  Ensure "Include Unit Tests" is selected

        6.  Click “Next"

    4. Save the project

        1.  Ensure “Create Git Repository on my Mac" is not selected

        2.  Navigate to your Desktop folder

        3.  Click “Create"

    5. Set up the module as shared (the same as how Alamofire does)

        1.  Select Product -> Scheme -> Manage Schemes...

        2.  Ensure "Shared" is checked on for the `__PROJECT_NAME__` scheme

        3.  Click "Close"

    6. Use the directory layout like Alamofire

        1.  Use Xcode to update the name and location of these folders

            1.  Open the file `__PROJECT_NAME__`.xcodeproj in Xcode
            2.  Enable Project navigator on the left and the File inspector on the right
            3.  Use the Project navigator to select the `__PROJECT_NAME__` folder (the yellow icon)
            4.  Use the File inspector to change the name to “Source"
                1.  :warning: Xcode bug: typing "Source" and pressing <kbd>return</kbd> will cause the name to change in the Project navigator, but the File inspector will remain unchanged. Click to some other item and then click the new "Source" folder to confirm that the name was changed correctly.
            5.  Use the Project navigator to select the `__PROJECT_NAME__Tests` folder
            6.  Use the File inspector to change the name to “Tests"
                1.  ⚠️ Xcode bug: typing "Tests" and pressing <kbd>return</kbd> will cause the name to change in the Project navigator, but the File inspector will remain unchanged. Click to some other item and then click the new "Tests" folder to confirm that the name was changed correctly.

        2.  Use Xcode to create a resources folder

            1.  Click `__PROJECT_NAME__` on the left (the blue icon)

            2.  Select File -> New -> Group and set the name to "Resources"

            3. Order the Source folder to above the Resources folder

        3.  Fix the Info.plist file configuration (Xcode makes renaming folders a pain)

            1.  Click `__PROJECT_NAME__` on the left (the blue icon)

            2.  Click the target `__PROJECT_NAME__` in the middle (the brown toolbox icon)

            3.  Click "Build Settings" on the top of the middle

            4.  Enter "Info.plist" in the search box

            5.  Edit the "Info.plist File" to be "Source/Info.plist"

            6.  Click the target `__PROJECT_NAME__Tests` in the middle (the grey Lego block icon)

            7.  Click "Build Settings" on the top of the middle

            8.  Enter "Info.plist" in the search box

            9.  Edit the "Info.plist File" to be "Tests/Info.plist"

    7. Add source code with some functionality to the module

        1. Use Terminal.app to insert some files into the project

              ```sh
              cd ~/Desktop/__PROJECT_NAME__/
              curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Resources/wk.png' -o Resources/wk.png
              curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Source/__PROJECT_NAME__.swift' -o Source/__PROJECT_NAME__.swift
              curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Source/__PROJECT_NAME__Label.h' -o Source/__PROJECT_NAME__Label.h
              curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Source/__PROJECT_NAME__Label.m' -o Source/__PROJECT_NAME__Label.m
              ```

        2. Use Xcode to add these files to the project

            1. Add source code to the Source folder

                1. Select the Source folder in the Project navigator
                2. Select File -> "Add Files To…"
                3. Navigate to ~/Desktop/`__PROJECT_NAME__`/Source/
                4. Select `__PROJECT_NAME__`.swift, `__PROJECT_NAME__Label`.h, and `__PROJECT_NAME__Label`.m
                5. Ensure that Add to targets has `__PROJECT_NAME__` checked on
                6. Click "Add"
            2. Add resource to the Resources folder

                1. Select the Resources folder in the Project navigator
                2. Select File -> "Add Files To..."
                3. Navigate to ~/Desktop/`__PROJECT_NAME__`/Resources/
                4. Select "wk.png"
                5. Ensure that Add to targets has `__PROJECT_NAME__` checked on
                6. Click "Add"
            3. Note: usually, resources should be built into an asset catalog deployed in the framework, especially images. This is so App Thinning can remove assets that aren’t appropriate for a specific device, resulting in a smaller app and happier users. Asset catalogs have superior compression options to those available to loose images.

    8. Change `__PROJECT_NAME__Label.h` membership to "Public"

        1. Select the `__PROJECT_NAME__` project (blue icon) in the Project navigator
        2. Highlight `__PROJECT_NAME__Label.h` in Project navigator
         3. In the right panel (File Inspector), Target Membership section, change membership to "Public"

     9. Add `__PROJECT_NAME__Label.h` to `__PROJECT_NAME__.h` file

        1. Select the `__PROJECT_NAME__` project (blue icon) in the Project navigator

        2. Highlight `__PROJECT_NAME__.h` (under "Source") in Project Navigator

        3. Paste this line at the end of the file:

            ```swift
            #import <__PROJECT_NAME__/__PROJECT_NAME__Label.h>
            ```

            Note: when you paste, it will add an extra blank line afterwards, leave it

3. Create a project for your iOS Example project

    1. Select File -> New -> Project…

    2. Configure the template for Swift iOS

        1.  Click “iOS"

        2.  Select “Single View App"

        3.  Click "Next"

    3. Set the project options

        1.  Set Product Name to "iOS Example"

        2.  Set Organization Name to `__ORGANIZATION NAME__`

        3.  Set Organization Identifier to `com.AN.ORGANIZATION.IDENTIFIER`

        4.  Set Language to "Swift"

        5.  Ensure "Include Unit Tests" is not selected

        6.  Ensure "Include UI Tests" is not selected

        7.  Click “Next"

    4. Save the project

        1.  Ensure “Create Git Repository" is not selected

        2.  Ensure add to is “Don’t add to any project or workspace"

        3.  Select and open the folder `__PROJECT_NAME__` on the desktop

        4.  Click “Create"

    5. Set up the module as shared (the same as how Alamofire does)

        1.  Select Product -> Scheme -> Manage Schemes…

        2.  Ensure "Shared" is checked on for the "iOS Example" scheme

        3.  Click "Close"

    6. Use the directory layout structure like Alamofire

        1.  Use Xcode to update the name and location of these folders

            1.   Open the file iOS Example.xcodeproj in Xcode
            2.   Enable the Project navigator on the left and the File inspector on the right
            3.   Use the Project navigator to select the "iOS Example" folder (yellow icon)
            4.   Use the File inspector to change the name to “Source"
                 1.   ⚠️ Xcode bug: typing "Source" and pressing <kbd>return</kbd> will cause the name to change in the Project navigator, but the File inspector will remain unchanged. Click to some other item and then click the new "Source" folder to confirm that the name was changed correctly.
                 2.   Note: this will cause a warning to produced in Xcode, ignore this warning for now

        2.  Fix the Info.plist file configuration (Xcode makes renaming folders a pain)

            1.  Click "iOS Example" on the left (the blue icon)

            2.  Click the target "iOS Example" in the middle (app icon)

            3.  Click Build Settings on the top of the middle

            4.  Enter "Info.plist" in the search box

            5.  Edit the "Info.plist File" to be "Source/Info.plist"

    7. Add source code with some functionality to the example

        1. Use Terminal.app to insert some files into the project

              ```sh
              cd ~/Desktop/__PROJECT_NAME__/iOS\ Example/
              curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/iOS%20Example/Source/Base.lproj/Main.storyboard' -o Source/Base.lproj/Main.storyboard
              ```

        2. Note: this replaces an existing file (from Xcode's Single View App template) so it is not necessary to add this file to the project.

4. Define packaging files for your module

    1. Use Terminal.app to insert a templated podspec (for CocoaPods consumers)

          ```sh
          cd ~/Desktop/__PROJECT_NAME__/
          curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/__PROJECT_NAME__.podspec' -o __PROJECT_NAME__.podspec
          ```

    2. Use Terminal.app to insert a templated Package.swift (for Swift Package Manager consumers)

          ```sh
          cd ~/Desktop/__PROJECT_NAME__/
          curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Package.swift' -o Package.swift
          ```

5. Use Xcode to manually to make the iOS Example use the module

    1.  Close all projects and workspaces currently open in Xcode
    2.  Select File -> New -> Workspace
    3.  Select `__PROJECT_NAME__` on the desktop, set the Save As to `__PROJECT_NAME__`.xcworkspace and click Save
    4.  Use Finder and drag `__PROJECT_NAME__`.xcodeproj into the workspace in Xcode in the Project Navigator section
    5.  Use Finder and drag iOS Example.xcodeproj (from inside the "iOS Example" folder) into the workspace in Xcode (make this below the other one, be sure you do NOT make it subordinated)
    6.  Click iOS Example on the left
    7.  Click Build Phases in the middle
    8.  Under Link Binaries With Libraries click the plus icon, select `__PROJECT_NAME__`.framework, and then click "Add"
    9.  Create a copy phase
        1.  Click the plus symbol (`+`) directly to the top-left of the phases to create a new phase
        2.  Choose New Copy Files Phase
        3.  Expand the newly created Copy Files phase
        4.  Set Destination to Frameworks
        5.  Click the plus symbol (`+`) under the files section
        6.  Select the `__PROJECT_NAME__.framework` option and click Add
        7.  Ensure Code Sign On Copy is checked on
    10.  Note: instructions for this step cite the authoritative document https://developer.apple.com/library/archive/technotes/tn2435/_index.html#//apple_ref/doc/uid/DTS40017543 which is currently marked as "no longer being updated".

6. Remove identifying parts of your project

    1. Use Terminal.app to find and replace all occurrences of hard-coded strings with template variables

          ```sh
          find -E ~/Desktop/__PROJECT_NAME__ \
              -regex '.*\.(h|swift)' -exec sed -i '' -E -e '
                  s-(// +Created by ).*( on ).*\.-\1__AUTHOR NAME__\2__TODAYS_DATE__.-
                  s-(// +Copyright © ).*-\1__TODAYS_YEAR__ __ORGANIZATION NAME__. All rights reserved.-' \
              '{}' \;
          ```

    2. Use Terminal.app to remove all references to development team IDs

          ```sh
          find ~/Desktop/__PROJECT_NAME__ -name project.pbxproj \
              -exec sed -i '' -E -e '/DevelopmentTeam = /d
                  s/(DEVELOPMENT_TEAM = )[^;]+/\1""/' '{}' \;
          ```

7. Use Terminal.app to add additional files to the project

  ```sh
  cd ~/Desktop/__PROJECT_NAME__/
  curl 'https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore' -o .gitignore
  echo '__PROJECT_NAME__.framework.zip' >> .gitignore
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/.travis.yml' -o .travis.yml
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/LICENSE' -o LICENSE
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/README.md' -o README.md
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/CHANGELOG.md' -o CHANGELOG.md
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/CONTRIBUTING.md' -o CONTRIBUTING.md
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Tests/CheckCocoaPodsQualityIndexes.rb' -o Tests/CheckCocoaPodsQualityIndexes.rb
  curl 'https://raw.githubusercontent.com/fulldecent/swift5-module-template/master/__PROJECT_NAME__/Project.swift' -o Project.swift
  ```

  Note: a some references for updating these files is:

  * https://github.com/Alamofire/Alamofire/blob/master/.travis.yml


## Taste testing

1.  Open `__PROJECT_NAME__`.xcworkspace

2.  Use the scheme navigator to select iOS Example and the latest iPhone version

3.  Select Product -> Run

You should see a big white king. That means it worked!

Note: there may be a warning about setting a team ID. You can safely ignore that warning.
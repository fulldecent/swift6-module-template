# Recipe

This recipe documents exactly how we created the template. Please follow along and you should create a template that is identical to the one we provided. If this recipe is not perfect (or your result different from the template) then please submit an issue or pull request.


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

1.  Open Xcode Version 8.0 (8A218a) *(this is the latest publicly released or Gold Master version)*

2.  Create a project for your module

    1.  Click “Create a new Xcode project"

    2.  Configure the template for a Swift module

        1.  Click “iOS"

        2.  Select "Cocoa Touch Framework"

        3.  Click “Next"

    3.  Set the project options

        1.  Set project name to `__PROJECT_NAME__`

        2.  Set organization name to `__ORGANIZATION NAME__`

        3.  Set organization identifier to `com.AN.ORGANIZATION.IDENTIFIER`

        4.  Set language to "Swift"

        5.  Ensure "Include Unit Tests" is selected

        6.  Click “Next"

    4.  Save the project

        1.  Ensure “Create Git Repository" is not selected

        2.  Navigate to your Desktop folder

        3.  Click “Create"

    5.  Set up the module as shared (the same as how Alamofire does)

        1.  Select Product -> Scheme -> Manage Schemes...

        2.  Click "Shared" for the `__PROJECT_NAME__` scheme

        3.  Click "Close"

    6.  Use the directory layout like Alamofire

        1.  Use Terminal.app to rename folders

                cd ~/Desktop/__PROJECT_NAME__/
                mv __PROJECT_NAME__/ Source
                mv __PROJECT_NAME__Tests/ Tests
                mkdir Resources

        2.  Use Xcode to update the name and location of these folders

            1.  Open the file `__PROJECT_NAME__`.xcodeproj in Xcode

            2.  Enable to Project navigator on the left and the File inspector on the right

            3.  Use the Project navigator to select the `__PROJECT_NAME__` folder

            4.  Use the File inspector to change the name to “Source"

            5.  Use the File inspector to change the location (the folder icon button) to ~/Desktop/`__PROJECT_NAME__`/Source

            6.  Use the Project navigator to select the `__PROJECT_NAME__Tests` folder

            7.  Use the File inspector to change the name to “Tests"

            8.  Use the File inspector to change the location (the folder icon button) to ~/Desktop/`__PROJECT_NAME__`/tests

            9.  Use the Project navigator to select the `__PROJECT_NAME__` project (the blue Xcode icon, not the folder icon)

        3.  Fix the Info.plist file configuration (this is a bug/workaround with Xcode, no radar submitted yet)

            1.  Click `__PROJECT_NAME__` on the left (the blue icon)

            2.  Click the target `__PROJECT_NAME__` in the middle

            3.  Click Build Settings on the top of the middle

            4.  Enter "Info.plist" in the search box

            5.  Edit the "Info.plist File" to be "Source/Info.plist"

    7.  Add source code with some functionality to the module

        1.  Use Terminal.app to insert some files into the project

                cd ~/Desktop/__PROJECT_NAME__/
                curl 'https://raw.githubusercontent.com/fulldecent/swift-package/master/__PROJECT_NAME__/Resources/wk.png' -o Resources/wk.png
                curl 'https://raw.githubusercontent.com/fulldecent/swift-package/master/__PROJECT_NAME__/Source/__PROJECT_NAME__.swift' -o Source/__PROJECT_NAME__.swift

        2.  Use Xcode to add these files to the project

            1.  Select File -> New -> Group and set the name to "Resources"

            2. Order the Source folder to above the Resources folder

            3. Drag the wk.png file in the Resources folder from Finder into the Resources folder in Xcode

                1.  Ensure “Copy items if needed” is not selected

                2.  Ensure Add to targets only selects `__PROJECT_NAME__`

            4. Drag the `__PROJECT_NAME__.swift` file in the Source folder from Finder into the Source folder in Xcode (put it above other items in the group)

                1.  Ensure “Copy items if needed” is not selected

                2.  Ensure Add to targets only selects `__PROJECT_NAME__`

3.  Create a project for your iOS Example project

    1.  Select File -> New -> Project

    2.  Configure the template for Swift iOS

        1.  Click “iOS"

        2.  Select “Single View Application"

        3.  Click "Next"

    3.  Set the project options

        1.  Set project name to "iOS Example"

        2.  Set organization name to `__ORGANIZATION NAME__`

        3.  Set organization identifier to `com.AN.ORGANIZATION.IDENTIFIER`

        4.  Set language to "Swift"

        5.  Set devices to “Universal"

        6.  Ensure "Include Unit Tests" is not selected

        7.  Ensure "Include UI Tests" is not selected

        8.  Click “Next"

    4.  Save the project

        1.  Ensure “Create Git Repository" is not selected

        2.  Ensure add to is “Don’t add to any project or workspace"

        3.  Select the folder `__PROJECT_NAME__` on the desktop

        4.  Click “Create"

    5.  Set up the module as shared (the same as how Alamofire does)

        1.  Select Product -> Scheme -> Manage Schemes...

        2.  Click "Shared" for the "iOS Example" scheme

        3.  Click "Close"

    6.  Use the directory layout structure like Alamofire

        1.  Use Terminal.app to rename folders

                cd ~/Desktop/__PROJECT_NAME__/iOS\ Example/
                mv iOS\ Example/ Source

        2.  Use Xcode to update the name and location of these folders

            1.   Open the file iOS Example.xcodeproj in Xcode

            2.   Enable to Project navigator on the left and the File inspector on the right

            3.   Use the Project navigator to select the "iOS Example" folder

            4.   Use the File inspector to change the name to “Source"

            5.   Use the File inspector to change the location (the folder icon button) to ~/Desktop/`__PROJECT_NAME__`/Source

          3.  Fix the Info.plist file configuration (this is a bug/workaround with Xcode, no radar submitted yet)

              1.  Click "iOS Example" on the left (the blue icon)

              2.  Click the target "iOS Example" in the middle

              3.  Click Build Settings on the top of the middle

              4.  Enter "Info.plist" in the search box

              5.  Edit the "Info.plist File" to be "Source/Info.plist"

    7.  Add source code with some functionality to the example

        1.  Use Terminal.app to insert some files into the project

                cd ~/Desktop/__PROJECT_NAME__/iOS\ Example/
                curl 'https://raw.githubusercontent.com/fulldecent/swift-package/master/__PROJECT_NAME__/iOS\ Example/Source/Base.lproj/Main.storyboard' -o Source/Base.lproj/Main.storyboard

    8.  Define packaging files for your module

        1.  Use Terminal.app to insert a templated podspec (for CocoaPods consumers)

                cd ~/Desktop/__PROJECT_NAME__/
                curl 'https://raw.githubusercontent.com/fulldecent/swift-package/master/__PROJECT_NAME__/__PROJECT_NAME__.podspec' -o __PROJECT_NAME__.podspec

        2.  Use Terminal.app to insert a templated Package.swift (for Swift Package Manager consumers)

                cd ~/Desktop/__PROJECT_NAME__/
                curl 'https://raw.githubusercontent.com/fulldecent/swift-package/master/__PROJECT_NAME__/Package.swift' -o Package.swift

4.  Use Xcode to manually to make the iOS Example use the module

    1.  Select File -> New -> Workspace

    2.  Select the `__PROJECT_NAME__` on the desktop and click save

    3.  Use Finder and drag `__PROJECT_NAME__`.xcodeproj into the workspace in Xcode

    4.  Use Finder and drag iOS Example.xcodeproj into the workspace in Xcode (make this below the other one, be sure you do NOT make it subordinated)

    5.  Click iOS Example on the left

    6.  Click Build Phases in the middle

    7.  Under Link Binaries With Libraries click the plus icon, select the `__PROJECT_NAME__` framework, and then click "Add"

5.  Remove identifying parts of your project

    1.  Use Atom text editor to find and replace all occurrences of these strings (NEED A MORE PORTABLE INSTRUCTION FOR THIS)

        1.  Replace occurrences of "Created by XXX on YYY" with "Created by `__AUTHOR NAME__` on `__TODAYS_DATE__`"

        2.  Replace occurrences of "Copyright © 2016" with "Copyright © __TODAYS_YEAR__"

6.  Use Terminal.app to add additional files to the project

    cd ~/Desktop/__PROJECT_NAME__/
    curl 'https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore' -o .gitignore
    echo '__PROJECT_NAME__.framework.zip' >> .gitignore
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/.travis.yml' -o .travis.yml
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/LICENSE' -o LICENSE
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/README.md' -o README.md
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/CHANGELOG.md' -o CHANGELOG.md
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/CONTRIBUTING.md' -o CONTRIBUTING.md
    echo '3.0' > .swift-version
    # Reference https://github.com/Alamofire/Alamofire/blob/master/.swift-version
    # Reference https://github.com/CocoaPods/CocoaPods/pull/5841
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/Tests/CheckCocoaPodsQualityIndexes.rb' -o Tests/CheckCocoaPodsQualityIndexes.rb
    curl 'https://raw.githubusercontent.com/fulldecent/swift3-module-template/master/__PROJECT_NAME__/Project.swift' -o Project.swift

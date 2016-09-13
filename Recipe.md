Variables
---------

Some variables have spaces in them. That is intentional because it causes Xcode to use double quotes around them in its project configuration files.

-   `__PROJECT_NAME__`

    -   Note this must be a valid C99 extended identifier (otherwise the Xcode check dependencies step fails). It cannot contain spaces.

-   `__ORGANIZATION NAME__`

-   `com.AN.ORGANIZATION.IDENTIFIER`

-   `__AUTHOR NAME__`

-   `__TODAYS_DATE__`

-   `__TODAYS_YEAR__`

-   `__GITHUB_USERNAME__`

The Recipe
----------

All of these instructions must be completed on the same calendar day.

1.  Open Xcode Version 8.0 (8A218a) *(this is the latest publicly released or Gold Master version)*

2.  Create a new project for your module

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

    5.  Use the directory layout structure like Alamofire

        1.  Make the `__PROJECT_NAME__` scheme shared (NEED MORE SPECIFIC DOCUMENTATION FOR THIS STEP)

        2.  Use Finder to open the project folder which is named `__PROJECT_NAME__`

            1.  Rename the enclosed folder also named `__PROJECT_NAME__` to “Source"

            2.  Rename the folder named `__PROJECT_NAME__Tests` to “Tests"

            3.  Create a new folder named “Resources"

            4.  Download the file <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/swift/Resources/wk.png> into the Resources folder

        3.  Use Xcode to update the name and location of these folders

            1.  Open the file `__PROJECT_NAME__`.xcodeproj in Xcode

            2.  Enable to Project navigator on the left and the File inspector on the right

            3.  Use the Project navigator to select the `__PROJECT_NAME__` folder

            4.  Use the File inspector to change the name to “Source"

            5.  Use the File inspector to change the location (the folder icon button) to ~/Desktop/`__PROJECT_NAME__`/source

            6.  Use the Project navigator to select the `__PROJECT_NAME__Tests` folder

            7.  Use the File inspector to change the name to “Tests"

            8.  Use the File inspector to change the location (the folder icon button) to ~/Desktop/`__PROJECT_NAME__`/tests

            9.  Use the Project navigator to select the `__PROJECT_NAME__` project (the blue Xcode icon, not the folder icon)

            10. Select File -> New -> Group and set the name to Resources

            11. Drag the wk.png file in the Resources folder from Finder into the Resources folder in Xcode

                1.  Ensure “Copy items if needed” is not selected

                2.  Ensure “Create folder references” is selected

                3.  Ensure Add to targets only selects `__PROJECT_NAME__`

            12. Order the Source folder to above the Resources folder

    6.  Use Xcode to add source code with some functionality to module

        1.  Use the Project navigator to select the Source folder

        2.  Create a new Swift file

            1.  Select File -> New -> File

            2.  Select "iOS"

            3.  Select "Swift file"

            4.  Click “Next"

            5.  Set the file name as `__PROJECT_NAME__`

            6.  Click “Create"

            7.  Open <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/swift/Source/PROJECT.swift> and copy starting at "import Foundation” and continuing to the end of the file

            8.  In Xcode select from “import Foundation” until the end of the file and paste

3.  Create a new project for your iOS Example project

    1.  Select File -> New -> Project

    2.  Configure the template for a Swift iOS

        1.  Click “iOS"

        2.  Select “Single View Application"

        3.  Click "Next"

    3.  Set the project options

        1.  Set project name to “Example"

        2.  Set organization name to `__ORGANIZATION NAME__`

        3.  Set organization identifier to `com.AN.ORGANIZATION.IDENTIFIER`

        4.  Set language to "Swift"

        5.  Set devices to “Universal"

        6.  Ensure "Include Unit Tests" is not selected

        7.  Ensure "Include UI Tests" is selected

        8.  Click “Next"

    4.  Save the project

        1.  Ensure “Create Git Repository" is not selected

        2.  Ensure add to is “Don’t add to any project or workspace"

        3.  Select the folder `__PROJECT_NAME__` on the desktop

        4.  Click “Create"

    5.  Use the directory layout structure like Alamofire

        1.  Change the name of the scheme from “Example" to "iOS Example” (NEED MORE SPECIFIC DOCUMENTATION FOR THIS STEP)

        2.  Change the name of the target from “Example” to “iOS Example” (NEED MORE SPECIFIC DOCUMENTATION FOR THIS STEP)

        3.  Change the name of the target from “ExampleUITests” to “iOS ExampleUITests” (NEED MORE SPECIFIC DOCUMENTATION FOR THIS STEP)

        4.  Use Finder to open the project folder which is named “Example"

            1.  Rename the enclosed folder also named “Example" to “Source"

            2.  Rename the folder named “ExampleUITests" to “UITests"

            3.  Rename the project named “Example.xcodeproj” to "iOS Example.xcodeproj” (Xcode will prompt you to “Close" or “Resave", click "Close")

        5.  Use Xcode to update the name and location of these folders

            1.  Open the file "iOS Example.xcodeproj" in Xcode

            2.  Enable to Project navigator on the left and the File inspector on the right

            3.  Use the Project navigator to select the “Example" folder

            4.  Use the File inspector to change the name to “Source"

            5.  Use the File inspector to change the location (the folder icon button) to ~/Desktop/Example/source

            6.  Use the Project navigator to select the “ExampleUITests" folder

            7.  Use the File inspector to change the name to “UITests"

            8.  Use the File inspector to change the location (the folder icon button) to ~/Desktop/Example/UITests

            9.  Use the Project navigator to select the `__PROJECT_NAME__` project (the blue Xcode icon, not the folder icon)

            10. Select File -> New -> Group and set the name to Resources

            11. Drag the wk.png file in the Resources folder from Finder into the Resources folder in Xcode

                4.  Ensure “Copy items if needed” is not selected

                5.  Ensure “Create folder references” is selected

                6.  Ensure Add to targets only selects `__PROJECT_NAME__`

            12. Order the Source folder to above the Resources folder

    6.  Use Xcode to add source code with some functionality to the example project

        1.  GET ALL WILL”S EXAMPLE CODE IN THERE FROM <https://github.com/CocoaPods/pod-template/tree/develop/templates/swift/Example/Source> SOMEONE PLEASE HELP DOCUMENT THIS STEP

4.  Define a CocoaPods file for the module (the producer)

    1.  Open <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/swift/PROJECT.podspec> using Textedit.app

    2.  Use `__PROJECT_NAME__` instead of "${POD_NAME}” or PROJECT

    3.  Use `__GITHUB_USERNAME__` instead of "<GITHUB_USERNAME>"

    4.  Save that file to ~/Desktop/`__PROJECT_NAME__`/`__PROJECT_NAME__`.podspec

    5.  Open Terminal.app

    6.  cd ~/Desktop/`__PROJECT_NAME__`/

    7.  mv `__PROJECT_NAME__`.podspec.txt `__PROJECT_NAME__`.podspec

5.  Define a CocoaPods file for the example (the consumer)

    1.  Open <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/swift/Example/Podfile> using Textedit.app

    2.  Use `__PROJECT_NAME__` instead of "${POD_NAME}”

    3.  Use "Quick', '~> 0.8” instead of "${INCLUDED_PODS}” (include the quotes in the replacement)

    4.  Use "iOS ExampleUITests” instead of “Tests"

    5.  Save that file to ~/Desktop/`__PROJECT_NAME__`/Example/Podfile

    6.  Open Terminal.app

    7.  cd ~/Desktop/`__PROJECT_NAME__`/Example/

    8.  mv Podfile.txt Podfile

    9.  pod install

6.  Remove identifying parts of your project

    1.  Use Atom text editor to find and replace all occurrences of these strings (NEED A MORE PORTABLE INSTRUCTION FOR THIS)

        1.  Replace your name with `__AUTHOR NAME__` (see the line Created by XXX on YYY.)

        2.  Replace the full date with `__TODAYS_DATE__` (see the line Created by XXX on YYY.)

        3.  Replace the current year with `__TODAYS_YEAR__` (see the line Copyright © XXX __ORGANIZATION NAME__)

7.  Add additional files to your project (NEED BETTER DOCUMENTATION HERE)

    1.  Add .gitignore from <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/baseline/.gitignore>

    2.  Add .travis.yml from <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/baseline/.travis.yml>

    3.  Add LICENSE from <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/baseline/LICENSE>

    4.  Add PROJECT.podspec from <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/swift/PROJECT.podspec>

    5.  Add README.md from <https://raw.githubusercontent.com/CocoaPods/pod-template/develop/templates/swift/README.md>

    6.  (SOME OF THESE FILES ABOVE ALSE REQUIRE SOME SUBSTITUTIONS TO BE MADE)

Using it
--------

To use this template, simply do a find-all and replace for each of the variables.

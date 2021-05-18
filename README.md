# SwiftUI-MVVM-C
A template project that uses SwiftUI for UI, Combine for event handling, MVVM-C for architecture

I have done some small projects using SwiftUI. It is really cool, simple and fast, but also have some disadvantage, that surely will be improved by Apple in the future. After some projects, I have been improving the project structure little by little, combine it with the MVVM-C architecture, what I have used on most UIKit projects before. Today, I am publishing a simple project, that conclude what I have learned, used in my previous SwiftUI project.

![Demo ToastSwiftUI](Images/demo.gif)

## Compatibility
- iOS 14 and later
- SwiftUI 2
- Swift 5 and later

## Project overview
The project uses the Github API to load a repo list of a user, show repo details when users tap on a repo. You can also tap on the top right icon to see user's profile. In this project, it is showing my repos. You can change it in `RepoListCoordinator.swift`.

The project uses MVVM-C (aka Model - View - ViewModel - Coordinator). Why there is Coordinator here? The Coordinator is an addition part for the MVVM, that help us to separate navigation handling code to a different place, instead of putting it in the View (or View Controller in UIKit). It makes the view (or view controller in UIKit) more reusable. In my SwiftUI projects, I decided Coordinator is a View as well, but only for handling navigation event purpose. 

## License
Copyright huynguyencong,  Licensed under the MIT license.

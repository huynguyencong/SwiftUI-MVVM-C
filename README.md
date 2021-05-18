# SwiftUI-MVVM-C
A template project that uses SwiftUI for UI, Combine for event handling, MVVM-C for architecture

I have done some small projects using SwiftUI. It is really cool, simple and fast, but also have some disadvantage, that surely will be improved by Apple in the future. After some projects, I improve the project structure litle by little, combine it with the MVVM-C architecture, what I have used on most UIKit project before. Today, I publish a simple project, that conclude what I have learnt, used in my previous SwiftUI project.

![Demo ToastSwiftUI](Images/demo.gif)

## Compatibility
- iOS 14 and later
- SwiftUI 2
- Swift 5 and later

## Project overview
The project uses Github API to load a repo list of a user, show repo details when user tap on a repo. You can also tap on the top right icon to see user's profile. In this project, it is showing my repos. You can change it in `RepoListCoordinator.swift`.

The project uses MVVM-C (aka Model - View - ViewModel - Coordinator). Why there is Coordinator here? Coordinator is an addition part for the MVVM, that help us to separate navigation handling code to a different place, instead of put it in the View (or View Controller in UIKit). In my SwiftUI projects, I decided Coordinator is a View as well, but only for handle navigation event purpose. 

## License
Copyright huynguyencong,  Licensed under the MIT license.

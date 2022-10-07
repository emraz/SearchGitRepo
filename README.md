# SearchGitRepo
### A demo project to demonstrate MVVM architechture with Combine and SwiftUI.

This project used API for fetching repository list from GitHub.
#### Ref: https://developer.github.com/v3/search/

### Development Environment 
1. Xcode Version 14.0.1

### How to setup
2. Open the project file `SearchGitRepo.xcodeproj` from the project directory
3. Run the scheme `SearchGitRepo` to run app
4. Please check `SearchGitRepoTests` to run test cases

### App structure:

- Utils: All helpers classes are here
- Resources: All resources including Mockdata
- Services: WebService / API are managed here
- VIewModels: Viewmodels are here
- Models: All models are here 
- Views: All Views and SubViews are here
- SearchGitRepoTests: Unit Test

Notes:
1. Here I tried to demonstrate very basic structure of MVVM + Combine + SwiftUI
2. As there is no instructions regarding Unit Test, I used basic Unit test for View Model initialization and api call success
3. I tried to cover the basic rules of SwiftUI, Combine and MVVM here, still I think we can do some improvemnets.

I try to finish it by  following the instructions are given. Please check.

Thank you so much :)

====== Happy Coding ======


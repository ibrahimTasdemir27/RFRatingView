
A simple ratings view written in Swift. Integer or Float.
[![Build Status](https://github.com/ytdl-org/youtube-dl/workflows/CI/badge.svg)](https://github.com/ytdl-org/youtube-dl/actions?query=workflow%3ACI)
![Static Badge](https://img.shields.io/badge/iOS-swift-xcode?logo=swift&link=https%3A%2F%2Fgithub.com%2FibrahimTasdemir27%2FRFRatingView)
<a href='https://www.linkedin.com/in/ibrahim-halil-taşdemir-ios-developer-111631245/' target="_blank"><img alt='linkedin' src='https://img.shields.io/badge/-100000?style=flat&logo=linkedin&logoColor=FFFFFF&labelColor=0B66C2&color=0B66C2'/></a>

<img alt="Static Badge" src="https://img.shields.io/badge/-0B66C2?logo=linkedin&link=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fibrahim-halil-ta%C5%9Fdemir-ios-developer-111631245">
<a href='https%3A%2F%2Fwww.linkedin.com%2Fin%2Fibrahim-halil-ta%C5%9Fdemir-ios-developer-111631245/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/-0B66C2?logo=linkedin">








# OUTPUT

- ### Star
     <img width="298" alt="Screenshot 2024-08-01 at 23 06 39" src="https://github.com/user-attachments/assets/fec0610b-5bf6-4a0f-b32d-a5a6a172f009">
    


- ### Circle _(Custom SFSymbols)_
     <img width="295" alt="Screenshot 2024-08-01 at 23 06 57" src="https://github.com/user-attachments/assets/f817ee01-242e-4467-a873-1f19ef19a545">



- ### Square _(Custom Image)_
     <img width="297" alt="Screenshot 2024-08-01 at 23 06 46" src="https://github.com/user-attachments/assets/2048df0e-bfda-4ce6-9840-12ffd4aeda89">

## Requirements
- iOS 13.0
- Xcode 15.0+
- Swift 5.9+



## Swift Package Manager

To integrate RFRatingView into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift


```
dependencies: [
    .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
]
```


## Usage

```swift
import RFRatingView

class ViewController: UIViewController {

    @IBOutlet weak var ratingView: RFRatingView!
    
    override func viewDidLoad() {
        ratingView.buttonImageType = .star //Pic.1
        ratingView.buttonImageType = .SFSymbols(selectedSymbolName: "circle.fill", unSelectedSymbolName: "circle") //Pic.2
        ratingView.buttonImageType = .custom(selectedImageName: "square-in-asset-fill", unSelectedImageName: "square-in-asset") //Pic.3
        ratingView.unselectedButtonTintColor = UIColor.gray
        ratingView.selectedButtonTintColor = UIColor.systemYellow
        ratingView.countOfRating = 5
        ratingView.currentRating = 2.4
    }
}

```









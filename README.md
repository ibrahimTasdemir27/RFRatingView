
# RFRatingView
<img alt="Static Badge" src="https://img.shields.io/badge/Xcode-UIView-xcode?&logo=xcode&color=CF212E"> <a href='https://github.com/ibrahimTasdemir27/RFRatingView/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/iOS-swift-xcode?logo=swift">
<a href='https://www.linkedin.com/in/ibrahim-halil-taşdemir-ios-developer-111631245/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/-0B66C2?logo=linkedin">
<a href='https://github.com/ibrahimTasdemir27/' target="_blank"><img alt="Static Badge" src="https://img.shields.io/badge/ibrahimtasdmr27-RFRatingView-xcode?logo=GitHub&color=CF212E">

- A simple ratings view written in Swift.
- Floating point accepts.
- You can add any image as the voting image via star, SF Symbols, or Assets.
- You can change the selected or unselected button color or the number of votes.










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
    .package(url: "https://github.com/ibrahimTasdemir27/RFRatingView", .upToNextMajor(from: "2.0.0"))
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









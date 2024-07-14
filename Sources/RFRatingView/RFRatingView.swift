//
//  RatingView.swift
//  RatingView
//
//  Created by İbrahim Taşdemir on 14.07.2024.
//

import UIKit


@frozen public enum RatingViewImageInstance {
    case star
    case SFSymbols(selectedSymbolName: String, unSelectedSymbolName: String)
    case custom(selectedImageName: String, unSelectedImageName: String)
    
    func getImage(isSelected: Bool) -> UIImage? {
        switch self {
        case .star:
            return UIImage(systemName: isSelected ? "star.fill" : "star")
        case .SFSymbols(let selectedSymbolName, let unSelectedSymbolName):
            return UIImage(systemName: isSelected ? selectedSymbolName : unSelectedSymbolName)
        case .custom(let selectedImageName, let unSelectedImageName):
            return UIImage(named: isSelected ? selectedImageName : unSelectedImageName)
        }
    }
}


protocol RatingViewDelegate: AnyObject {
    func didChangedRating(_ newValue: Int)
}

@IBDesignable
public class RFRatingView: UIView {
    
    //MARK: -> View
    private let rootContentView = UIStackView()
    private let backgroundView = UIStackView()
    
    
    //MARK: -> Delegate
    var delegate: RatingViewDelegate?
    
    
    //MARK: -> Env
    @IBInspectable public var countOfRating: Int = 5
    @IBInspectable public var unselectedButtonTintColor: UIColor = UIColor.gray
    @IBInspectable public var selectedButtonTintColor: UIColor = UIColor.systemYellow
    public var buttonImageType: RatingViewImageInstance = .star
    public var buttonLists: [UIButton] = []
    
    public var currentRating: Float = 0 {
        didSet {
            guard currentRating >= 0 && currentRating <= 5 else {
                currentRating = oldValue
                return
            }
            injectRating(with: currentRating)
        }
    }
    
    
    //MARK: -> Init UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    

    private func createButtonInstance() -> UIButton {
        let button = UIButton()
        button.tintColor = unselectedButtonTintColor
        button.setImage(buttonImageType.getImage(isSelected: false), for: .normal)
        
        return button
    }
    
    private func setupViews() {
        guard Thread.isMainThread else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.axis = .horizontal
        backgroundView.spacing = 2
        backgroundView.alignment = .fill
        
        rootContentView.translatesAutoresizingMaskIntoConstraints = false
        rootContentView.axis = .horizontal
        rootContentView.spacing = 2
        rootContentView.alignment = .fill
        
        
        for i in 0..<countOfRating {
            let backgroundButton = createButtonInstance()
            backgroundView.addArrangedSubview(backgroundButton)
            let button = createButtonInstance()
            button.addTarget(self, action: #selector(didChangeSelectedRating(_:)), for: .touchUpInside)
            button.tag = i
            rootContentView.addArrangedSubview(button)
            buttonLists.append(button)
        }
        
        self.addSubview(backgroundView)
        self.addSubview(rootContentView)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rootContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rootContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rootContentView.topAnchor.constraint(equalTo: topAnchor),
            rootContentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}


//MARK: -> Functions
extension RFRatingView {
    private func updateButtonLayout(for button: UIButton, isSelected: Bool) {
        button.tintColor = isSelected ? selectedButtonTintColor : unselectedButtonTintColor
        button.setImage(buttonImageType.getImage(isSelected: isSelected), for: .normal)
        button.layer.mask = nil
    }
    
    @objc private func didChangeSelectedRating(_ sender: UIButton) {
        guard Thread.isMainThread else {
            return
        }
        
        let buttonIndex = sender.tag
        buttonLists.enumerated().forEach { index, button in
            let isSelected = index <= buttonIndex
            updateButtonLayout(for: button, isSelected: isSelected)
        }
        
        delegate?.didChangedRating(buttonIndex)
    }
    
    private func injectRating(with ratingValue: Float) {
        guard Thread.isMainThread else {
            return
        }
        let isInteger = ratingValue.truncatingRemainder(dividingBy: 1) == 0
        
        if (isInteger) {
            didChangeSelectedRating(buttonLists[Int(ratingValue)])
        } else {
            //Küsüratlı
            let floatingPoint = ratingValue.truncatingRemainder(dividingBy: 1)
            let index = Int(ratingValue - floatingPoint)
            
            didChangeSelectedRating(buttonLists[index])
            setRateFloatingButton(floatingPoint, with: buttonLists[index])
        }
    }
    
    private func setRateFloatingButton(_ rate: Float, with button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        let maskLayer = CALayer()
        maskLayer.frame = CGRect(
            x: 0, y: 0,
            width: CGFloat(rate) * button.frame.size.width,
            height: button.frame.size.height
        )
        maskLayer.backgroundColor = unselectedButtonTintColor.cgColor
        button.layer.mask = maskLayer
    }
}

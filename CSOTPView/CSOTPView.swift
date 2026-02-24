//
//  CSOTPView.swift
//  CSOTPView
//
//  Created by Chaitanya Soni on 25/01/21.
//  Copyright © 2021 Chaitanya Soni. All rights reserved.
//

import UIKit
//import Appearance

@IBDesignable
public class CSOTPView: UIView, NibLoadable {
	@IBInspectable var isSixDigit: Bool = false {
		didSet {
			if isSixDigit {
				tfOne.superview?.isHidden = false
				tfTwo.superview?.isHidden = false
				tfThree.superview?.isHidden = false
				tfFour.superview?.isHidden = false
				tfFive.superview?.isHidden = false
				tfSix.superview?.isHidden = false
			} else {
				tfOne.superview?.isHidden = false
				tfTwo.superview?.isHidden = false
				tfThree.superview?.isHidden = false
				tfFour.superview?.isHidden = false
				tfFive.superview?.isHidden = true
				tfSix.superview?.isHidden = true
			}
		}
	}
	
	@IBOutlet weak private var verticalStackView: UIStackView!
	@IBOutlet weak private var horizontalStackView: UIStackView!
	
	@IBOutlet weak private var titleLabel: UILabel!
	
    @IBOutlet weak var tfContainerView: UIView!
    @IBOutlet weak private var tfOne: UITextField!
	@IBOutlet weak private var tfOneBottom: NSLayoutConstraint!
    @IBOutlet weak private var lineOne: UILabel!
    @IBOutlet weak private var tfTwo: UITextField!
	@IBOutlet weak private var tfTwoBottom: NSLayoutConstraint!
    @IBOutlet weak private var lineTwo: UILabel!
	@IBOutlet weak private var tfThree: UITextField!
	@IBOutlet weak private var tfThreeBottom: NSLayoutConstraint!
    @IBOutlet weak private var lineThree: UILabel!
	@IBOutlet weak private var tfFour: UITextField!
	@IBOutlet weak private var tfFourBottom: NSLayoutConstraint!
    @IBOutlet weak private var lineFour: UILabel!
	@IBOutlet weak private var tfFive: UITextField!
	@IBOutlet weak private var tfFiveBottom: NSLayoutConstraint!
    @IBOutlet weak private var lineFive: UILabel!
	@IBOutlet weak private var tfSix: UITextField!
	@IBOutlet weak private var tfSixBottom: NSLayoutConstraint!
    @IBOutlet weak private var lineSix: UILabel!
	
    @IBOutlet weak private var sideShowTextButtonContainer: UIView!
    @IBOutlet weak private var sideShowTextButton: UIButton!
    @IBOutlet weak private var inputTextField: UITextField!
	
	@IBOutlet weak private var showTextButtonContainer: UIView!
	@IBOutlet weak private var showTextButton: UIButton!
	
	public var separatorHeight: CGFloat = 1 {
		didSet {
			tfOneBottom.constant = separatorHeight
			tfTwoBottom.constant = separatorHeight
			tfThreeBottom.constant = separatorHeight
			tfFourBottom.constant = separatorHeight
			tfFiveBottom.constant = separatorHeight
			tfSixBottom.constant = separatorHeight
		}
	}
	
    public var titleText: String? {
        didSet {
            //guard let titleText = titleText else { return }
            titleLabel.text = titleText
        }
    }
    
    public var isTitleCenter: Bool = true {
        didSet {
            //guard let titleText = titleText else { return }
            titleLabel.textAlignment = isTitleCenter ? .center : .left
        }
    }
    
    public var isTitleShow: Bool = true {
        didSet {
            //guard let titleText = titleText else { return }
            titleLabel.isHidden = !isTitleShow
        }
    }
    public var titleColor: UIColor?{
        didSet {
            //guard let titleText = titleText else { return }
            titleLabel.textColor = titleColor
        }
    }
    public var titleFont: UIFont? {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    public var showOTPButton: Bool = false {
        didSet {
            showTextButtonContainer.isHidden = !showOTPButton
        }
    }
    
    public var sdieShowOTPButton: Bool = false {
        didSet {
            sideShowTextButtonContainer.isHidden = !sdieShowOTPButton
        }
    }
    
    public var textFieldColor: UIColor = .white {
        didSet {
            tfOne.backgroundColor = textFieldColor
            tfTwo.backgroundColor = textFieldColor
            tfThree.backgroundColor = textFieldColor
            tfFour.backgroundColor = textFieldColor
            tfFive.backgroundColor = textFieldColor
            tfSix.backgroundColor = textFieldColor
        }
    }
    
    public var textFieldBorderWidth: CGFloat = 0 {
        didSet {
            tfOne.layer.borderWidth = textFieldBorderWidth
            tfTwo.layer.borderWidth = textFieldBorderWidth
            tfThree.layer.borderWidth = textFieldBorderWidth
            tfFour.layer.borderWidth = textFieldBorderWidth
            tfFive.layer.borderWidth = textFieldBorderWidth
            tfSix.layer.borderWidth = textFieldBorderWidth
        }
    }
    public var tfContainerBorderWidth: CGFloat = 0 {
        didSet {
            tfContainerView.layer.borderWidth = tfContainerBorderWidth
        }
    }
    public var tfContainerBorderColor: UIColor = .white {
        didSet {
            tfContainerView.layer.borderColor = tfContainerBorderColor.cgColor
        }
    }
    public var tfContCornerRadius: CGFloat = 0 {
        didSet {
            tfContainerView.layer.cornerRadius = tfContCornerRadius
        }
    }

    public var textFieldBorderColor: UIColor = .white {
        didSet {
            tfOne.layer.borderColor = textFieldBorderColor.cgColor
            tfTwo.layer.borderColor = textFieldBorderColor.cgColor
            tfThree.layer.borderColor = textFieldBorderColor.cgColor
            tfFour.layer.borderColor = textFieldBorderColor.cgColor
            tfFive.layer.borderColor = textFieldBorderColor.cgColor
            tfSix.layer.borderColor = textFieldBorderColor.cgColor
        }
    }
    
    public var textFieldCornerRadius: CGFloat = 0 {
        didSet {
            tfOne.layer.cornerRadius = textFieldCornerRadius
            tfTwo.layer.cornerRadius = textFieldCornerRadius
            tfThree.layer.cornerRadius = textFieldCornerRadius
            tfFour.layer.cornerRadius = textFieldCornerRadius
            tfFive.layer.cornerRadius = textFieldCornerRadius
            tfSix.layer.cornerRadius = textFieldCornerRadius
        }
    }
    
    public var keyboardType: UIKeyboardType = .numberPad {
        didSet {
            inputTextField.keyboardType = keyboardType
        }
    }

	public var currentOTP: String = ""
    public var otpChanged: ((String) -> Void)?
    public var hideShowChanged: ((Bool) -> Void)?
    public var didBegin: (() -> Void)?
    public var didEnd: (() -> Void)?

	required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
		commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
		commonInit()
    }
	
	public func clear() {
		tfOne.text = nil
		tfTwo.text = nil
		tfThree.text = nil
		tfFour.text = nil
		tfFive.text = nil
		tfSix.text = nil
		inputTextField.text = nil
        currentOTP = ""
	}
	
	private func commonInit() {
        sdieShowOTPButton = false
		inputTextField.delegate = self
      //  inputTextField.keyboardType = .numberPad
        lineOne.isHidden = true
        lineTwo.isHidden = true
        lineThree.isHidden = true
        lineFour.isHidden = true
        lineFive.isHidden = true
        lineSix.isHidden = true
        self.showTextButton.addTarget(self, action: #selector(self.toggleSecureText), for: .touchUpInside)
        self.sideShowTextButton.addTarget(self, action: #selector(self.toggleSecureSideText), for: .touchUpInside)
        self.inputTextField.addTarget(self, action: #selector(textField_editingChanged), for: .editingChanged)
	}
	
	@objc private func toggleSecureText() {
        AnalyticsUtilites.triggerAnalyticsEvent(event: "tap_icon_eye", screenName: "Tap eye", identifier: "Tap eye", element: "eye", action1: "", action2: "tap", myBundle: [:])
        self.showTextButton.isSelected = !self.showTextButton.isSelected
        hideShowChanged?(self.showTextButton.isSelected)
        secureTextEntryToggle()
	}
    public func secureTextEntryToggle(){
        tfOne.isSecureTextEntry.toggle()
        tfTwo.isSecureTextEntry.toggle()
        tfThree.isSecureTextEntry.toggle()
        tfFour.isSecureTextEntry.toggle()
        tfFive.isSecureTextEntry.toggle()
        tfSix.isSecureTextEntry.toggle()
    }
    @objc private func toggleSecureSideText() {
        self.sideShowTextButton.isSelected = !self.sideShowTextButton.isSelected
        hideShowChanged?(self.sideShowTextButton.isSelected)
        secureTextEntryToggle()
    }
    
    private func manageTFBorderColor(colouredTF:UITextField?,textfields:[UITextField], line: [UILabel], showLine: UILabel) {
        colouredTF?.layer.borderColor = UIColor.themeBlueColor.cgColor
        showLine.isHidden = false
        colouredTF?.tintColor = .red
        textfields.forEach { tf in
            tf.layer.borderColor = textFieldBorderColor.cgColor
        }
        line.forEach { lb in
            lb.isHidden = true
        }
    }
    
    @objc func textField_editingChanged(sender:UITextField) {
        if sender.text?.count == (isSixDigit ? 6 : 4) {
            self.endEditing(true)
        }
    }
	
	
}


extension CSOTPView: UITextFieldDelegate {
	public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if keyboardType == .numberPad{
            if string != "" && Int(string) == nil {
                print("Not a number")
                return false
            }
        }
		
		guard let text = textField.text, let textRange = Range(range, in: text) else { return false }
           
           
		let updatedText = text.replacingCharacters(in: textRange,
		with: string)
		let otpArray = Array(updatedText)
		
		tfOne.text = nil
		tfTwo.text = nil
		tfThree.text = nil
		tfFour.text = nil
		tfFive.text = nil
		tfSix.text = nil
        tfOne.layer.borderColor = UIColor.themeBlueColor.cgColor
        tfTwo.layer.borderColor = textFieldBorderColor.cgColor
        if isSixDigit{
            lineOne.isHidden = false
            lineTwo.isHidden = true
            lineThree.isHidden = true
            lineFour.isHidden = true
            lineFive.isHidden = true
            lineSix.isHidden = true
        }

		for (index, element) in otpArray.enumerated() {
			
			switch index {
				
			case 0:
				tfOne.text = "\(element)"
                manageTFBorderColor(colouredTF: tfTwo, textfields: [tfOne,tfThree,tfFour,tfFive,tfSix],line: [lineOne, lineThree, lineFour, lineFive, lineSix], showLine: isSixDigit ? lineTwo : UILabel())
			case 1:
				tfTwo.text = "\(element)"
                manageTFBorderColor(colouredTF: tfThree, textfields: [tfOne,tfTwo,tfFour,tfFive,tfSix],line: [lineOne, lineTwo, lineFour, lineFive, lineSix], showLine: isSixDigit ? lineThree : UILabel())
            
			case 2:
				tfThree.text = "\(element)"
                manageTFBorderColor(colouredTF: tfFour, textfields: [tfOne,tfTwo,tfThree,tfFive,tfSix],line: [lineOne, lineThree, lineTwo, lineFive, lineSix], showLine: isSixDigit ? lineFour : UILabel())
			case 3:
				tfFour.text = "\(element)"
                manageTFBorderColor(colouredTF: tfFive, textfields: [tfOne,tfTwo,tfFour,tfThree,tfSix],line: [lineOne, lineThree, lineFour, lineTwo, lineSix], showLine: isSixDigit ? lineFive : UILabel())
			case 4:
				tfFive.text = "\(element)"
                manageTFBorderColor(colouredTF: tfSix, textfields: [tfOne,tfTwo,tfFour,tfThree,tfFive],line: [lineOne, lineThree, lineFour, lineFive, lineTwo], showLine: isSixDigit ? lineSix : UILabel())
			case 5:
                tfSix.text = "\(element)"
                manageTFBorderColor(colouredTF: nil, textfields: [tfOne,tfTwo,tfThree,tfFour,tfFive,tfSix],line: [lineOne, lineTwo, lineThree, lineFour, lineFive, lineSix], showLine: UILabel())
			default:
				break
			}
			
		}
		
//		print(range)
//		print(otpArray)
//		print(string)
//		print(self.inputTextField.text)
		
//		if range.location <= 3 {
			
//		}
		let isValid = isSixDigit ? range.location <= 5 : range.location <= 3
		
		if isValid {
			currentOTP = updatedText
			otpChanged?(updatedText)
		}
//        if currentOTP.count == (isSixDigit ? 6 : 4) {
//            self.endEditing(true)
//        }
		return isValid
	}
//	public func textFieldDidBeginEditing(_ textField: UITextField) {
//		print(textField.text)
//	}
	public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.endEditing(true)
		return true
	}
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == ""{
            manageTFBorderColor(colouredTF: tfOne, textfields: [tfFive,tfTwo,tfFour,tfThree,tfSix], line: [lineTwo, lineThree, lineFour, lineFive, lineSix], showLine: isSixDigit ? lineOne : UILabel())
        }
        didBegin?()
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        manageTFBorderColor(colouredTF: nil, textfields: [tfOne,tfTwo,tfThree,tfFour,tfFive,tfSix], line: [lineOne, lineTwo, lineThree, lineFour, lineFive, lineSix], showLine: UILabel())
        didEnd?()
    }
    
}


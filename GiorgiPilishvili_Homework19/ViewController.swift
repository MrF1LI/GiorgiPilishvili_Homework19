//
//  ViewController.swift
//  GiorgiPilishvili_Homework19
//
//  Created by GIORGI PILISSHVILI on 21.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Views
    
    lazy var labelTitle: UILabel = {
        var labelTitle = UILabel()
        view.addSubview(labelTitle)
        return labelTitle
    }()
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        view.addSubview(stackView)
        return stackView
    }()
    
    // Logo
    
    lazy var imageViewContainer: UIView = { // For imageViewLogo Shadow
        var imageViewContainer = UIView()
        stackView.addArrangedSubview(imageViewContainer)
        return imageViewContainer
    }()
    
    lazy var imageViewLogo: UIImageView = {
        var imageViewLogo = UIImageView()
        imageViewContainer.addSubview(imageViewLogo)
        return imageViewLogo
    }()
    
    // Text Fields Container
    
    lazy var stackViewTextFields: UIStackView = {
        var stackViewTextFields = UIStackView()
        stackView.addArrangedSubview(stackViewTextFields)
        return stackViewTextFields
    }()
    
    // Text Fields
    
    lazy var textFieldEmail: UITextField = {
        var textFieldEmail = UITextField()
        stackViewTextFields.addArrangedSubview(textFieldEmail)
        return textFieldEmail
    }()
    
    lazy var textFieldPassword: UITextField = {
        var textFieldPassword = UITextField()
        stackViewTextFields.addArrangedSubview(textFieldPassword)
        return textFieldPassword
    }()
    
    // Sign In / Sign Up
    
    lazy var buttonSignIn: UIButton = {
        var buttonSignIn = UIButton()
        stackView.addArrangedSubview(buttonSignIn)
        return buttonSignIn
    }()
        
    lazy var buttonSignUp: UIButton = {
        var buttonSignUp = UIButton()
        view.addSubview(buttonSignUp)
        return buttonSignUp
    }()
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
    }
    
    // MARK: Functions
    
    func configureDesign() {
        addBackground()
        addLabelTitle()
        addStackView()
        addImageViewContainer()
        addImageViewLogo()
        addStackViewTextFields()
        addTextFieldEmail()
        addTextFieldPassword()
        addButtonSignIn()
        addButtonSignUp()
    }
    
    func addBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemBlue.cgColor
        ]
        view.layer.addSublayer(gradientLayer)
    }
    
    func addLabelTitle() {
        
        labelTitle.text = "iOS App Templates"
        labelTitle.textColor = .white
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 30)
        
        // Shadow
        
        labelTitle.layer.shadowColor = UIColor.black.cgColor
        labelTitle.layer.shadowRadius = 8
        labelTitle.layer.shadowOpacity = 0.4
        labelTitle.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        // Constraints
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Top
        
        NSLayoutConstraint(item: labelTitle,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20).isActive = true
        
        // Width
        
        NSLayoutConstraint(item: labelTitle,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 0.9,
                           constant: 0).isActive = true
        
    }
    
    func addStackView() {
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 50
        
        // Constraints
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Width
        
        NSLayoutConstraint(item: stackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 0.9,
                           constant: 0).isActive = true
        
    }
    
    func addImageViewContainer() { // For imageViewLogo Shadow
        
        imageViewContainer.clipsToBounds = false
        setShadow(view: imageViewContainer)
        
        // Constraints
        
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imageViewContainer.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        
        // Width
        
        NSLayoutConstraint(item: imageViewContainer,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: stackView,
                           attribute: .width,
                           multiplier: 0.70,
                           constant: 0).isActive = true
        
        // Height
        
        NSLayoutConstraint(item: imageViewContainer,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageViewContainer,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    func addImageViewLogo() {
        
        imageViewLogo.image = UIImage(named: "logo")
        
        // Constraints
        
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        
        // Width
        
        NSLayoutConstraint(item: imageViewLogo,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: imageViewContainer,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Height

        NSLayoutConstraint(item: imageViewLogo,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageViewContainer,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Corner radius
        
        imageViewLogo.layoutIfNeeded()
        imageViewLogo.layer.cornerRadius = imageViewLogo.frame.width / 2
        imageViewLogo.layer.masksToBounds = true
        
        // Border
        
        imageViewLogo.layer.borderColor = UIColor.white.cgColor
        imageViewLogo.layer.borderWidth = 3
        
    }
    
    func addStackViewTextFields() {
        
        stackViewTextFields.axis = .vertical
        stackViewTextFields.distribution  = .equalSpacing
        stackViewTextFields.alignment = .fill
        stackViewTextFields.spacing = 15
        
        // Constraints
                
        stackViewTextFields.translatesAutoresizingMaskIntoConstraints = false
        
        // Width
        
        NSLayoutConstraint(item: stackViewTextFields,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: stackView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
                
    }
    
    func addTextFieldEmail() {
        
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.placeholder = "Email"
        textFieldEmail.backgroundColor = .white
        textFieldEmail.layer.cornerRadius = 15
        textFieldEmail.setLeftPadding(20)
        
        setShadow(view: textFieldEmail)
        
        // Height constraint
        
        NSLayoutConstraint(item: textFieldEmail,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50).isActive = true

    }
    
    func addTextFieldPassword() {
        
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.placeholder = "Password"
        textFieldPassword.backgroundColor = .white
        textFieldPassword.layer.cornerRadius = 15
        textFieldPassword.setLeftPadding(20)
        
        setShadow(view: textFieldPassword)
        
        // Height constraint
        
        NSLayoutConstraint(item: textFieldPassword,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50).isActive = true

    }
    
    func addButtonSignIn() {
        
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn.setTitle("Sign In", for: .normal)
        buttonSignIn.backgroundColor = .systemGreen
        buttonSignIn.layer.cornerRadius = 15
        
        // Shadow
        
        setShadow(view: buttonSignIn)
                
        // Width constraint
        
        NSLayoutConstraint(item: buttonSignIn,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: stackView,
                           attribute: .width,
                           multiplier: 0.85,
                           constant: 0).isActive = true
        
        // Height
        
        NSLayoutConstraint(item: buttonSignIn,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50).isActive = true
        
    }
    
    func addButtonSignUp() {
        
        buttonSignUp.setTitle("Don't have an account? Sign Up", for: .normal)
        buttonSignUp.setTitleColor(.black, for: .normal)
        
        // Constraints
        
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        buttonSignUp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        // Bottom
        
        NSLayoutConstraint(item: buttonSignUp,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        // Width
        
        NSLayoutConstraint(item: buttonSignUp,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 0.8,
                           constant: 0).isActive = true
        
    }
    
    // Shadow function for text fields and button

    func setShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 10
        view.layer.masksToBounds = false
    }
    
}

// Extension For TextField padding

extension UITextField {
    
    func setLeftPadding(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}

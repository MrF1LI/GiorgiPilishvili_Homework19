//
//  ViewControllerWithoutStackView.swift
//  GiorgiPilishvili_Homework19
//
//  Created by GIORGI PILISSHVILI on 21.07.22.
//

import UIKit

class ViewControllerWithoutStackView: UIViewController {

    // MARK: Views
    
    lazy var labelTitle: UILabel = {
        var labelTitle = UILabel()
        view.addSubview(labelTitle)
        return labelTitle
    }()
    
    // Logo
    
    lazy var imageViewContainer: UIView = { // For imageViewLogo Shadow
        var imageViewContainer = UIView()
        view.addSubview(imageViewContainer)
        return imageViewContainer
    }()
    
    lazy var imageViewLogo: UIImageView = {
        var imageViewLogo = UIImageView()
        imageViewContainer.addSubview(imageViewLogo)
        return imageViewLogo
    }()
    
    // Text Fields
    
    lazy var textFieldEmail: UITextField = {
        var textFieldEmail = UITextField()
        view.addSubview(textFieldEmail)
        return textFieldEmail
    }()
    
    lazy var textFieldPassword: UITextField = {
        var textFieldPassword = UITextField()
        view.addSubview(textFieldPassword)
        return textFieldPassword
    }()
    
    // Sign In / Sign Up buttons
    
    lazy var buttonSignIn: UIButton = {
        var buttonSignIn = UIButton()
        buttonSignIn.addTarget(self, action: #selector(self.signInButtonAction), for: .touchUpInside)
        view.addSubview(buttonSignIn)
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
        addImageViewContainer()
        addImageViewLogo()
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
    
    func addImageViewContainer() { // For imageViewLogo Shadow
        
        imageViewContainer.clipsToBounds = false
        setShadow(view: imageViewContainer)
        
        // Constraints
        
        imageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imageViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let imageViewContainerGuide = UILayoutGuide()
        view.addLayoutGuide(imageViewContainerGuide)
        imageViewContainerGuide.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/5).isActive = true
        imageViewContainerGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageViewContainer.centerYAnchor.constraint(equalTo: imageViewContainerGuide.centerYAnchor).isActive = true

        // Width
        
        NSLayoutConstraint(item: imageViewContainer,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .width,
                           multiplier: 0.6,
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
    
    func addTextFieldEmail() {
        
        textFieldEmail.placeholder = "Email"
        textFieldEmail.backgroundColor = .white
        textFieldEmail.layer.cornerRadius = 15
        textFieldEmail.setLeftPadding(20)
        
        setShadow(view: textFieldEmail)
        
        // Constraints
        
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Top
        
        NSLayoutConstraint(item: textFieldEmail,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageViewContainer,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 50).isActive = true
        
        // Width constraint
        
        NSLayoutConstraint(item: textFieldEmail,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .width,
                           multiplier: 0.9,
                           constant: 0).isActive = true
        
        // Height
        
        NSLayoutConstraint(item: textFieldEmail,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50).isActive = true
        
    }
    
    func addTextFieldPassword() {
        
        textFieldPassword.placeholder = "Password"
        textFieldPassword.backgroundColor = .white
        textFieldPassword.layer.cornerRadius = 15
        textFieldPassword.setLeftPadding(20)
        
        setShadow(view: textFieldPassword)
        
        // Constraints
        
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Top
        
        NSLayoutConstraint(item: textFieldPassword,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: textFieldEmail,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 15).isActive = true
        
        // Width constraint
        
        NSLayoutConstraint(item: textFieldPassword,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: textFieldEmail,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Height
        
        NSLayoutConstraint(item: textFieldPassword,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: textFieldEmail,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
    }
    
    func addButtonSignIn() {
        
        buttonSignIn.setTitle("Sign In", for: .normal)
        buttonSignIn.backgroundColor = .systemGreen
        buttonSignIn.layer.cornerRadius = 15
        
        // Shadow
        
        setShadow(view: buttonSignIn)
        
        // Constraints
        
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Top
        
        NSLayoutConstraint(item: buttonSignIn,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: textFieldPassword,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 50).isActive = true
        
        // Width
        
        NSLayoutConstraint(item: buttonSignIn,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .width,
                           multiplier: 0.75,
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
    
    @objc func signInButtonAction(sender: UIButton) {
        dismiss(animated: true)
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

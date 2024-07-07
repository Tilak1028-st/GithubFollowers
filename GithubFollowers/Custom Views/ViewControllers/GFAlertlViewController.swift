//
//  GFAlertlViewController.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 06/07/24.
//

import UIKit

class GFAlertlViewController: UIViewController {

    let containerView = GFContainerView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backGroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle:  String?
    
    let pading: CGFloat = 20.0
    
    init(alertTitle: String? = nil, message: String? = nil, buttonTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 250),
            containerView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: pading),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: pading),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -pading),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        
        actionButton.addTarget(self, action: #selector(didTapOnActionButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -pading),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: pading),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -pading),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureBodyLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: pading),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -pading),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc private func didTapOnActionButton() {
        dismiss(animated: true)
    }
}

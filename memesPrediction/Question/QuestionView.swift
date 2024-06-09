//
//  QuestionView.swift
//  memesPrediction
//
//  Created by Natalia on 07.06.2024.
//

import UIKit

protocol QuestionViewDelegate: AnyObject {
    func getPredictionButtonPressed()
}

class QuestionView: UIView {
    
    weak var delegate: QuestionViewDelegate?
    
    private(set) lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Write your question here"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private lazy var getPredictionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get prediction", for: .normal)
        button.addTarget(
            self,
            action: #selector(getPredictionButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(textField)
        addSubview(getPredictionButton)
    }
    
    private func setConstraints() {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        getPredictionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getPredictionButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40),
            getPredictionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc private func getPredictionButtonPressed() {
        delegate?.getPredictionButtonPressed()
    }
}

//
//  PredictionView.swift
//  memesPrediction
//
//  Created by Natalia on 07.06.2024.
//

import UIKit

protocol PredictionViewDelegate: AnyObject {
    func likeButtonPressed()
    func dislikeButtonPressed()
}

class PredictionView: UIView {
    
    weak var delegate: PredictionViewDelegate?
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "responderChain")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("👍", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 60)
        button.addTarget(
            self,
            action: #selector(likeButtonPressed),
            for: .touchUpInside)
        return button
    }()
    
    private lazy var dislikeButton: UIButton = {
        let button = UIButton()
        button.setTitle("👎", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 60)
        button.addTarget(
            self,
            action: #selector(dislikeButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let contentContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    init(image: UIImage) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        imageView.image = image
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(with image: UIImage) {
        imageView.image = image
    }
    
    private func addSubviews() {
        buttonStack.addArrangedSubview(likeButton)
        buttonStack.addArrangedSubview(dislikeButton)
        contentContainer.addArrangedSubview(imageView)
        contentContainer.addArrangedSubview(buttonStack)
        self.addSubview(contentContainer)
    }
    
    private func setConstraints() {
        
        [imageView, contentContainer].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            contentContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            contentContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            contentContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc private func likeButtonPressed() {
        delegate?.likeButtonPressed()
    }
    
    @objc private func dislikeButtonPressed() {
        delegate?.dislikeButtonPressed()
    }
}

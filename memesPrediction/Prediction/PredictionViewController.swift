//
//  PredictionViewController.swift
//  memesPrediction
//
//  Created by Natalia on 07.06.2024.
//

import UIKit

class PredictionViewController: UIViewController {

    
    private var customView: PredictionView!
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        
        customView = PredictionView(image: image)
        customView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PredictionViewController: PredictionViewDelegate {
    func likeButtonPressed() {
        dismiss(animated: true)
    }
    
    func dislikeButtonPressed() {
        getPrediction()
    }
    
    private func getPrediction() {
        
        NetworkManager.shared.getMeme { memData in
            let mem = memData.data.memes.randomElement()
            guard let memUrl = mem?.url else { return }
            
            NetworkManager.shared.getImage(url: memUrl) { [weak self] image in
                self?.customView.configureView(with: image)
            }
        }
    }
}

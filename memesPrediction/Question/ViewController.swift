//
//  ViewController.swift
//  memesPrediction
//
//  Created by Natalia on 07.06.2024.
//

import UIKit

class ViewController: UIViewController {

    let customView = QuestionView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        customView.textField.delegate = self
    }


    private func getPrediction() {
        
        NetworkManager.shared.getMeme { memData in
            let mem = memData.data.memes.randomElement()
            guard let memUrl = mem?.url else { return }
            
            NetworkManager.shared.getImage(url: memUrl) { image in
                let vc = PredictionViewController(image: image)
                self.present(vc, animated: true)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        customView.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        customView.textField.resignFirstResponder()
        return true
    }
}

extension ViewController: QuestionViewDelegate {
    func getPredictionButtonPressed() {
        getPrediction()
    }
    
}

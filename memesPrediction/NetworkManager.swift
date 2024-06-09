//
//  NetworkManager.swift
//  memesPrediction
//
//  Created by Natalia on 07.06.2024.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func getMeme(completion: @escaping (MemData) -> Void) {
        let urlString = "https://api.imgflip.com/get_memes"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let memData = try JSONDecoder().decode(MemData.self, from: data)
                DispatchQueue.main.async {
                    completion(memData)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func getImage(url: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        .resume()
    }
    
}

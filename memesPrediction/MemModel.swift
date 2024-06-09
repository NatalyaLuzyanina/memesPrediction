//
//  MemModel.swift
//  memesPrediction
//
//  Created by Natalia on 07.06.2024.
//

struct MemData: Decodable {
    let data: MemModel
}

struct MemModel: Decodable {
    let memes: [Mem]
}

struct Mem: Decodable {
    let id: String
    let name: String
    let url: String
}

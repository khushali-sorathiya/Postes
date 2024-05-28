//
//  postModel.swift
//  Postes
//
//  Created by Krupesh Savaliya on 28/05/24.
//

import Foundation


struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
}

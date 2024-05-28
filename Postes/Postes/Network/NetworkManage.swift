//
//  NetworkManage.swift
//  Postes
//
//  Created by Krupesh Savaliya on 28/05/24.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchPosts(page: Int, limit: Int, completion: @escaping (Result<[Post], Error>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let parameters: [String: Any] = ["_page": page, "_limit": limit]
        
        AF.request(url, parameters: parameters).responseDecodable(of: [Post].self) { response in
            switch response.result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

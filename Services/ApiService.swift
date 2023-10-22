//
//  ApiService.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 19/10/23.
//

import Foundation
import Alamofire

class ApiService {
    static let shared: ApiService = ApiService()
    private init() { }
    private let API_KEY = ""
    private let BASE_URL = "https://berita-indo-api-next.vercel.app/api/tempo-news/"
    
    // Alamofire
    func loadLatestNews (completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "\(BASE_URL)"
        AF.request(urlString, method: HTTPMethod.get, parameters: ["api-key": API_KEY])
            .validate()
            .responseDecodable(of:NewsResponse.self) { response in
                switch response.result {
                case .success(let newsResponse):
                    completion(.success(newsResponse.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

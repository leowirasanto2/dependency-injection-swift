//
//  BaseService.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation
import CoreData

protocol APIService: AnyObject {
    func fetch<T: Decodable>(_ request: APIRequest, result: @escaping (Result<T, CustomError>) -> Void)
}

class DefaultAPIService: APIService {
    
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func fetch<T>(_ request: APIRequest, result: @escaping (Result<T, CustomError>) -> Void) where T : Decodable {
        let urlString = baseUrl + request.endPoint + (request.parameters ?? [:]).queryString
        
        guard let url = URL(string: (urlString)) else {
            result(.failure(.generalError))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                result(.failure(.generalError))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                result(.failure(.generalError))
                return
            }
            
            do {
                let dcoder = JSONDecoder()
                dcoder.keyDecodingStrategy = request.keyCodingStrategy
                let response = try dcoder.decode(T.self, from: data)
                result(.success(response))
            }
            catch {
                result(.failure(.generalError))
            }
        }.resume()
    }
}

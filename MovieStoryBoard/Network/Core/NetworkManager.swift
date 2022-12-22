//
//  NetworkManager.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T:Codable>(type: T.Type, url:String, method: HtppMethods, completion:@escaping((Result<T,ErrorTypes>)->())) {
        let session = URLSession.shared
        if let url =  URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(.generalError))
                    return
                }else if let data = data {
                    print(data)
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                }else {
                    completion(.failure(.invalidUrl))
                }
                            
                }
            dataTask.resume()
        }
        }
    
    fileprivate func handleResponse<T:Codable>(data: Data, completion: @escaping((Result<T,ErrorTypes>)->())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        }catch {
            completion(.failure(.invalidData))
        }
    }
    }



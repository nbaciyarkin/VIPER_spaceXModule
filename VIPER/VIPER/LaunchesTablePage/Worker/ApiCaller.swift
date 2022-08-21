//
//  NetworkManager.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation

struct Constants {
    static let baseUrl = "https://api.spacexdata.com/v5"
}

struct EndPoints {
    static let launches = "/launches"
}

enum APIError: Error {
    case failedToGetData
}

class ApiCaller {
    
    static let shared = ApiCaller()
    
    
//    func getAllLaunches(from url: URL) async throws -> [LaunchModel]{
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return try JSONDecoder().decode([LaunchModel].self, from: data)
//    }
    
    func getAllLaunches(completion: @escaping (Result<[LaunchModel],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl+EndPoints.launches)") else {return}

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode([LaunchModel].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}

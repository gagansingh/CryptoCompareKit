//
//  CryptoCompare.swift
//  Coins Explorer
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import UIKit

public class CryptoCompare {
    
    public typealias SuccessResponse<T> = (_ data: T) -> Void
    public typealias FailureResponse = (_ error: Error) -> Void
    public typealias EmptyResponse = () -> Void
    
    private enum API {
        static let baseURL = "https://min-api.cryptocompare.com"
    }
    
    enum HTTPMethod: String {
        case get = "GET"
    }

    private let urlSession = URLSession(configuration: .default)
    
    public static let shared = CryptoCompare()
    
    private init() {}
    
    internal func request<T: Decodable>(_ endpoint: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters = [:],
                               success: SuccessResponse<T>?,
                               failure: FailureResponse?) {
        let urlRequest = buildURLRequest(endpoint, method: method, parameters: parameters)
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                DispatchQueue.global(qos: .utility).async {
                    do {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        let object = try jsonDecoder.decode(CryptoCompareResponse<T>.self, from: data)
                        if let data = object.data {
                            DispatchQueue.main.async {
                                success?(data)
                            }
                        }
                    } catch let error {
                        print(error)
                        DispatchQueue.main.async {
                            failure?(CryptoCompareError.decoding(message: error.localizedDescription))
                        }
                    }
                }
            } else if let error = error {
                failure?(error)
            }
        }.resume()
    }
    
    private func buildURLRequest(_ endpoint: String, method: HTTPMethod, parameters: Parameters) -> URLRequest {
        let url = URL(string: API.baseURL + endpoint)!
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        switch method {
        case .get:
            urlRequest.url?.appendQueryParameters(parameters)
        }
        return urlRequest
    }
}

//
//  CryptoCompare.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import os.log

public class CryptoCompare: CryptoCompareProtocol {

    public static var apiKey: String = ""

    private enum API {
        static let baseURL = "https://min-api.cryptocompare.com/data"
    }

    public enum HTTPMethod: String {
        case get = "GET"
    }

    private let urlSession = URLSession(configuration: .default)

    public static let shared = CryptoCompare()

    private init() {}

    @discardableResult
    public func request<T: Decodable>(_ endpoint: String,
                                      method: HTTPMethod = .get,
                                      parameters: Parameters = [:],
                                      completionHandler: (@escaping (Result<T, Error>) -> Void))
        -> CryptoCompareRequest? {
        if let urlRequest = buildURLRequest(endpoint, method: method, parameters: parameters) {
            let task = urlSession.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    completionHandler(.failure(error))
                } else {
                    if let http = response as? HTTPURLResponse {
                        switch http.statusCode {
                        case 200:
                            if let data = data {
                                DispatchQueue.global(qos: .utility).async {
                                    do {
                                        let jsonDecoder = JSONDecoder()
                                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                                        let object = try jsonDecoder.decode(T.self, from: data)
                                        DispatchQueue.main.async {
                                            completionHandler(.success(object))
                                        }
                                    } catch let error {
                                        DispatchQueue.main.async {
                                            completionHandler(.failure(CryptoCompareError.decoding(message:
                                              error.localizedDescription)))
                                        }
                                    }
                                }
                            }
                        default:
                            completionHandler(.failure(
                                CryptoCompareError.serverError(statusCode: http.statusCode)))
                        }
                    }
                }
            }
            task.resume()
            return CryptoCompareRequest(task: task)
        }
        return nil
    }

    private func buildURLRequest(_ endpoint: String,
                                 method: HTTPMethod,
                                 parameters: Parameters) -> URLRequest? {
        if let url = URL(string: API.baseURL + endpoint) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            if !CryptoCompare.apiKey.isEmpty {
                urlRequest.url?.appendQueryParameters(["api_key": CryptoCompare.apiKey])
            }
            switch method {
            case .get:
                urlRequest.url?.appendQueryParameters(parameters)
            }
            os_log("%@ %s",
                   log: Log.cryptoCompare,
                   type: .debug, #function,
                   urlRequest.url?.absoluteString ?? "")
            return urlRequest
        }
        return nil
    }
}

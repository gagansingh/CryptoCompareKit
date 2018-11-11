//
//  CryptoCompare.swift
//  CryptoCompareKit
//
//  Created by Spiros Gerokostas on 04/11/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import os.log

public class CryptoCompare {

    public typealias SuccessResponse<T> = (_ data: T) -> Void
    public typealias FailureResponse = (_ error: Error) -> Void

    private enum API {
        static let baseURL = "https://min-api.cryptocompare.com/data"
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
        if let urlRequest = buildURLRequest(endpoint, method: method, parameters: parameters) {
            urlSession.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    failure?(error)
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
                                            success?(object)
                                        }
                                    } catch let error {
                                        print(error)
                                        DispatchQueue.main.async {
                                            failure?(CryptoCompareError.decoding(message:
                                                error.localizedDescription))
                                        }
                                    }
                                }
                            }
                        default:
                            failure?(CryptoCompareError.serverError(statusCode: http.statusCode))
                        }
                    }
                }
            }.resume()
        }
    }

    private func buildURLRequest(_ endpoint: String,
                                 method: HTTPMethod,
                                 parameters: Parameters) -> URLRequest? {
        if let url = URL(string: API.baseURL + endpoint) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
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

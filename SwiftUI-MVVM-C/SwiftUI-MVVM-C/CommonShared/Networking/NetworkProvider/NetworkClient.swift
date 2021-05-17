//
//  NetworkClient.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation
import Alamofire
import Combine

class NetworkClient: NetworkProvider {
    static let instance = NetworkClient()
    
    private let session: Session
    
    private init() {
        session = Session.default
    }
    
    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error> {
        let requestInfo = info.asRequestInfo()
        
        return session.request(requestInfo.url, method: requestInfo.method, parameters: requestInfo.parameters, encoding: requestInfo.encoding, headers: requestInfo.headers, interceptor: requestInfo.interceptor, requestModifier: requestInfo.requestModifier).publishData().tryMap { response -> Data in
                switch response.result {
                case .success(let data):
                    return data
                case .failure(let error):
                    throw error
                }
        }
        .eraseToAnyPublisher()
    }
}

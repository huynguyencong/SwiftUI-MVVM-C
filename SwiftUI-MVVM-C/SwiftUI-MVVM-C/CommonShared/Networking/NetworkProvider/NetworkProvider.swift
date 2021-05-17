//
//  NetworkProvider.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation

import Alamofire
import Combine

protocol NetworkProvider {
    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error>
}

struct RequestInfo {
    var url: URLConvertible
    var method: HTTPMethod
    var parameters: Parameters?
    var encoding: ParameterEncoding
    var headers: HTTPHeaders?
    var interceptor: RequestInterceptor?
    var requestModifier: Session.RequestModifier?
    
    init(url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, interceptor: RequestInterceptor? = nil, requestModifier: Session.RequestModifier? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.interceptor = interceptor
        self.requestModifier = requestModifier
    }
}

protocol RequestInfoConvertible {
    func asRequestInfo() -> RequestInfo
}

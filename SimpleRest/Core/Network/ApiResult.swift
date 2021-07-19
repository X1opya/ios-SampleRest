//
//  ApiResult.swift
//  SimpleRest
//
//  Created by extdev on 09.07.2021.
//

import Foundation

enum ApiResult<T> {
  case loading
  case success(T)
  case failure(HttpError)
}

struct HttpError {
  let statusCode: Int?
  let errorMsg: String?
  let error: Error?
}

typealias ComplitionHandler<T> = (ApiResult<T>) -> Void

typealias MapedComplitionHandler<T> = (_ data: [T]?, _ loading: Bool, _ error: HttpError?) -> Void

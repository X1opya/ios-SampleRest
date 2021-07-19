//
//  RequestMethod.swift
//  SimpleRest
//
//  Created by extdev on 08.07.2021.
//

import Foundation

enum RequestMethod {
  case GET
  case POST
}

extension RequestMethod {
  func toString() -> String {
    var result = ""
    switch self {
    case RequestMethod.GET: result = "GET"
      break
    default: result = "POST"
    }
    return result
  }
}

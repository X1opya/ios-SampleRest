//
//  RMListRepository.swift
//  SimpleRest
//
//  Created by extdev on 15.07.2021.
//

import Foundation

class RMListRepositor {
  private let apiService: ApiService
  
  init(api: ApiService) {
    apiService = api
  }
  
  func loadCharacters(onComplite:  @escaping ComplitionHandler<RMResponse>) {
    ApiService().requestCharacters(endpoint: "", type: RMResponse.self, completionHandler: { (response) in
      onComplite(response)
    })
  }
}

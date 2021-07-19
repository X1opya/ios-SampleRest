//
//  ListVM.swift
//  SimpleRest
//
//  Created by extdev on 15.07.2021.
//

import Foundation

protocol CharactersDelegate {
  func onSuccess(_ list: [CharacterDto])
  
  func onLoading(isLoading: Bool)
  
  func onError(msg: String)
}

class CharactersVM {
  var delegate: CharactersDelegate? = nil
  var loading: Bool = false {
    didSet {
      delegate?.onLoading(isLoading: loading)
    }
  }
  
  var list: [CharacterDto] = [] {
    didSet {
      delegate?.onSuccess(list)
    }
  }
  var error: String? = nil {
    didSet {
      delegate?.onError(msg: error ?? "Unknown error" )
    }
  }
  
  private var repository: RMListRepositor
  
  init(repository: RMListRepositor) {
    self.repository = repository
  }
  
  func loadCharacters() {
    repository.loadCharacters(onComplite: { response in      
      switch response {
      case .loading: self.loading = true
      case .failure(let error):
        self.loading = false
        self.error = error.errorMsg
      case .success(let response):
        self.loading = false
        self.list = response.results
      }
    })
  }
  
}

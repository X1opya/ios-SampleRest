
import Foundation

struct RMResponse : Decodable {
  let info: ResponseInfo
  let results: [CharacterDto]
}

struct ResponseInfo : Decodable {
  let count: Int
  let pages: Int
  let next: String?
  let prev: String?
}

struct CharacterDto : Decodable {
  let id: Int
  let name: String?
  let status: String?
  let species: String?
  let image: String?
  let origin: Place?
  let location: Place?
}

struct Place: Decodable {
  let name: String?
}

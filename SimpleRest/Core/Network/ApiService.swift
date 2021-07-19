
import Foundation


class ApiService {
  private var HOST: URL? = URL(string: "https://rickandmortyapi.com/api/character")
  private lazy var request: URLRequest? = {
    return URLRequest(url: self.HOST!)
  }()
  private var session = URLSession.init(configuration: URLSessionConfiguration.default)
  
  //todo пока обрабатывает только один запрос персонажей
  func requestCharacters<T : Decodable>(method: RequestMethod = RequestMethod.GET, endpoint: String, type: T.Type, completionHandler: @escaping ComplitionHandler<T>) {
    guard HOST != nil else {
      return
    }
    request!.httpMethod = method.toString()
    request?.url = HOST
    session.dataTask(with: request!, completionHandler: {(data, response, error) in
      completionHandler(ApiResult.loading)
      guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
        let httpResponse = response as? HTTPURLResponse
        completionHandler(ApiResult.failure(HttpError(statusCode: httpResponse?.statusCode, errorMsg: httpResponse?.description, error: nil)))
        return
      }
      do{
        let decoded = try JSONDecoder().decode(type, from: data!)
        completionHandler(ApiResult.success(decoded))
      } catch {
        completionHandler(ApiResult.failure(HttpError(statusCode: nil, errorMsg: nil, error: error)))
      }
      
    }).resume()
  }
  
}

import Foundation

protocol PolygonsAPI: AnyObject {
    func fetchPolygons(completion: @escaping (Result<[PolygonsResponse], Error>)->Void)
}

final class PolygonsAPIImp: PolygonsAPI {
    
    let baseUrl = URL(string: "http://84.201.169.126")!
    
    func fetchPolygons(completion: @escaping (Result<[PolygonsResponse], Error>) -> Void) {
        URLSession.shared.dataTask(with: baseUrl.appendingPathComponent("api/v1/poly")) { result in
            switch result {
            case .success(let data):
                do {
                    let polygonsResponse = try JSONDecoder().decode([PolygonsResponse].self, from: data)
                    completion(.success(polygonsResponse))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
}

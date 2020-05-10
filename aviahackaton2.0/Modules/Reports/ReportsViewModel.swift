import Combine
import Foundation

final class ReportsViewModel: ObservableObject {
    
    @Published var polygons: [PolygonsResponse] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    let polygonsAPI: PolygonsAPI = PolygonsAPIImp()
    
    func fetchPolygons() {
        polygonsAPI.fetchPolygons { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let polygons):
                    self?.polygons = polygons
                case .failure(let error):
                    print("обидно, чо: \(error)")
                }
            }
        }
    }
}

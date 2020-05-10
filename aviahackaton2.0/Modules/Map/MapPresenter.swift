import UIKit

protocol MapViewOutput: ViewOutput {
    func centerOf(points: [CGPoint]) -> CGPoint?
}

final class MapPresenter: MapViewOutput {
    weak var view: MapViewInput!
    var polygonsApi: PolygonsAPI!
    
    func viewDidLoad() {
        polygonsApi.fetchPolygons { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let polygons):
                    self?.view.show(polygons)
                case .failure(let error):
                    self?.view.show(error)
                }
            }
        }
    }
    
    func centerOf(points: [CGPoint]) -> CGPoint? {
        guard points.count >= 3 else { return nil }
        
        var sum: CGFloat = 0
        var pSum: CGPoint = .zero
        
        for i in 0..<points.count {
            let p1 = points[i]
            let p2 = points[(i+1) % points.count]
            let cross = p1.x * p2.y - p1.y * p2.x
            sum += cross
            pSum = CGPoint(x:((p1.x + p2.x) * cross) + pSum.x,
                           y:((p1.y + p2.y) * cross) + pSum.y)
        }
        
        let z = 1 / (3 * sum)
        return CGPoint(x: pSum.x * z,
                       y: pSum.y * z)
    }
}

protocol MapViewInput: AnyObject {
    func show(_ error: Error)
    func show(_ polygons: [PolygonsResponse])
}

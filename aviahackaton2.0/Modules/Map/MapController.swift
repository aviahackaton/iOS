import ViewSpecificController
import MapKit

final class MapController: UIViewController, ViewSpecificController {
    
    typealias RootView = MapView
    
    var presenter: MapViewOutput!
    let locationManager = CLLocationManager()
    
    var mapViewDelegate: MapViewDelegate? {
        didSet {
            view().mapView.delegate = mapViewDelegate
        }
    }
    
    override func loadView() {
        view = MapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        mapViewDelegate = MapViewDelegate()
        
        setupMap()
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(rightBarButtonTapped(_:))),
            UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadButtonTapped(_:)))
        ]
    }
    
    private func setupMap() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    @objc private func rightBarButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @objc private func reloadButtonTapped(_ sender: UIBarButtonItem) {
        
    }
}

extension MapController: MapViewInput {
    func show(_ polygons: [PolygonsResponse]) {
        polygons.forEach { polygon in
            var locations = polygon.coordinates.map { CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lng) }
            
            let points = polygon.coordinates.map { CGPoint(x: $0.lat, y: $0.lng) }
            let point = presenter.centerOf(points: points)
            let annotationPoint = CLLocationCoordinate2D(latitude: Double(point?.x ?? 0), longitude: Double(point?.y ?? 0))
            let annotation = MKPointAnnotation()
            annotation.coordinate = annotationPoint
            annotation.title = polygon.name
            view().mapView.addAnnotation(annotation)
            
            let polygon = Polygon(coordinates: &locations, count: locations.count)
            view().mapView.addOverlay(polygon)
        }
    }
    
    func show(_ error: Error) {
        let alertController = UIAlertController(title: "Ахтунг!", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Эх", style: .default) { [unowned self] _ in
            self.presenter.viewDidLoad()
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

import Nibless
import MapKit

final class MapView: NLView {
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .hybrid
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mapView)
    }
    
    override func layoutSubviews() {
        mapView.frame = bounds
    }
}

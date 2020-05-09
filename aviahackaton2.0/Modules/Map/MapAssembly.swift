import UIKit.UIViewController

final class MapAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = MapController()
        let presenter = MapPresenter()
        let polygonsAPI = PolygonsAPIImp()
        
        view.presenter = presenter
        presenter.view = view
        presenter.polygonsApi = polygonsAPI
        
        return view
    }
}

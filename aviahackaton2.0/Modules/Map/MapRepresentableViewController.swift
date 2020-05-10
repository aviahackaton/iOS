import SwiftUI

struct MapRepresantableViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<MapRepresantableViewController>) -> MapController {
        MapAssembly.assemble()
    }
    
    func updateUIViewController(_ uiViewController: MapController, context: UIViewControllerRepresentableContext<MapRepresantableViewController>) {
    }
}

struct MapViewController_Previews: PreviewProvider {
    static var previews: some View {
        MapRepresantableViewController()
    }
}

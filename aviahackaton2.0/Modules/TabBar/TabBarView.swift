import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MapRepresantableViewController()
                .edgesIgnoringSafeArea(.top)
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }.tag(0)
            Text("Типо важный экран, который никто не должен видеть")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(1)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

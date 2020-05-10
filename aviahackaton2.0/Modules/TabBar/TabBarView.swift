import SwiftUI

struct TabBarView: View {
    
    @State var isReportsActive = false
    
    var body: some View {
        TabView {
            NavigationView {
                MapRepresantableViewController()
                    .navigationBarTitle(Text("Map"))
                    .navigationBarItems(trailing:
                        NavigationLink(destination: ReportsView(), isActive: $isReportsActive) {
                            Image(systemName: "text.justify")
                    })
            }
            .tabItem {
                Image(systemName: "map")
                Text("Map")
            }.tag(1)
            ResultsView()
                .tabItem {
                    Image(systemName: "text.justify")
                    Text("Results")
            }
            Text("Типо важный экран, который никто не должен видеть")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }.tag(2)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

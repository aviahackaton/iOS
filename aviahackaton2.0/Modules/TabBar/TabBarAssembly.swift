import SwiftUI

final class TabBarAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        UIHostingController(rootView: TabBarView())
    }
}

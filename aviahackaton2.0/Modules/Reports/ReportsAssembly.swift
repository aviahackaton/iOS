import SwiftUI

final class ReportsAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        UIHostingController(rootView: ReportsView())
    }
}

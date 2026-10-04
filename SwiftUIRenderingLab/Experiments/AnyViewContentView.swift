import SwiftUI

struct AnyViewContentView: View {

    let showCircle: Bool

    var body: some View {
        RenderLogger.log("AnyViewContentView")

        return AnyView(
            Group {
                if showCircle {
                    Circle()
                        .frame(width: 50, height: 50)
                } else {
                    Text("AnyView")
                }
            }
        )
    }
}

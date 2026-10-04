import SwiftUI

struct NormalContentView: View {

    let showCircle: Bool

    var body: some View {
        RenderLogger.log("NormalContentView")

        return Group {
            if showCircle {
                Circle()
                    .frame(width: 50, height: 50)
            } else {
                Text("Normal View")
            }
        }
    }
}

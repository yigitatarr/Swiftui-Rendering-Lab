import SwiftUI

struct StaticView: View {

    let title: String

    var body: some View {
        RenderLogger.log("StaticView")

        return Text(title)
            .padding()
    }
}

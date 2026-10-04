import SwiftUI

struct AnyViewExperimentView: View {

    @State private var showCircle = false

    var body: some View {
        RenderLogger.log("AnyViewExperimentView")

        return VStack(spacing: 24) {

            Text("AnyView Experiment")
                .font(.title2)
                .bold()

            Text(showCircle ? "Circle" : "Text")

            Button("Toggle Content") {
                RenderLogger.reset()

                showCircle.toggle()

                DispatchQueue.main.async {
                    print("=== Dynamic AnyView Results ===")
                    print(
                        "AnyViewExperimentView: \(RenderLogger.count(for: "AnyViewExperimentView"))"
                    )
                    print(
                        "NormalContentView: \(RenderLogger.count(for: "NormalContentView"))"
                    )
                    print(
                        "AnyViewContentView: \(RenderLogger.count(for: "AnyViewContentView"))"
                    )
                }
            }

            Text("Normal")

            NormalContentView(
                showCircle: showCircle
            )

            Text("AnyView")

            AnyViewContentView(
                showCircle: showCircle
            )
        }
        .padding()
    }
}

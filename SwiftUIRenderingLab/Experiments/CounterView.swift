import SwiftUI

struct CounterView: View {

    let parentCount: Int
    let identity: Int

    @State private var count = 0

    var body: some View {
        RenderLogger.log("CounterView")

        return VStack(spacing: 12) {

            Text("Parent Count: \(parentCount)")

            Text("Identity: \(identity)")

            Text("Counter: \(count)")
                .font(.headline)

            Button("Increment") {
                RenderLogger.reset()

                count += 1

                DispatchQueue.main.async {
                    print("=== Counter Update Results ===")
                    print(
                        "RenderingExperimentView: \(RenderLogger.count(for: "RenderingExperimentView"))"
                    )
                    print(
                        "CounterView: \(RenderLogger.count(for: "CounterView"))"
                    )
                    print(
                        "StaticView: \(RenderLogger.count(for: "StaticView"))"
                    )
                }
            }
        }
        .padding()
    }
}

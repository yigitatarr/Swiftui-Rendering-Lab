import SwiftUI

struct RenderingExperimentView: View {

    @State private var parentCount = 0
    @State private var counterIdentity = 0
    @State private var equatableValue = 0

    var body: some View {
        RenderLogger.log("RenderingExperimentView")

        return ScrollView {
            VStack(spacing: 24) {

                Text("SwiftUI Rendering Lab")
                    .font(.title2)
                    .bold()

                Text("Parent Count: \(parentCount)")

                Button("Update Parent") {
                    RenderLogger.reset()

                    parentCount += 1

                    DispatchQueue.main.async {
                        print("=== Parent Update Results ===")
                        print(
                            "RenderingExperimentView: \(RenderLogger.count(for: "RenderingExperimentView"))"
                        )
                        print(
                            "CounterView: \(RenderLogger.count(for: "CounterView"))"
                        )
                        print(
                            "EquatableCounterView: \(RenderLogger.count(for: "EquatableCounterView"))"
                        )
                        print(
                            "StaticView: \(RenderLogger.count(for: "StaticView"))"
                        )
                    }
                }

                Button("Change Equatable Value") {
                    RenderLogger.reset()

                    equatableValue += 1

                    DispatchQueue.main.async {
                        print("=== Equatable Value Change Results ===")
                        print(
                            "RenderingExperimentView: \(RenderLogger.count(for: "RenderingExperimentView"))"
                        )
                        print(
                            "CounterView: \(RenderLogger.count(for: "CounterView"))"
                        )
                        print(
                            "EquatableCounterView: \(RenderLogger.count(for: "EquatableCounterView"))"
                        )
                        print(
                            "StaticView: \(RenderLogger.count(for: "StaticView"))"
                        )
                    }
                }

                Button("Change Identity") {
                    RenderLogger.reset()

                    counterIdentity += 1

                    DispatchQueue.main.async {
                        print("=== Identity Change Results ===")
                        print(
                            "RenderingExperimentView: \(RenderLogger.count(for: "RenderingExperimentView"))"
                        )
                        print(
                            "CounterView: \(RenderLogger.count(for: "CounterView"))"
                        )
                        print(
                            "EquatableCounterView: \(RenderLogger.count(for: "EquatableCounterView"))"
                        )
                        print(
                            "StaticView: \(RenderLogger.count(for: "StaticView"))"
                        )
                    }
                }

                CounterView(
                    parentCount: parentCount,
                    identity: counterIdentity
                )
                .id(counterIdentity)

                EquatableCounterView(
                    value: equatableValue
                )
                .equatable()

                StaticView(
                    title: "Static View"
                )
            }
            .padding()
        }
    }
}

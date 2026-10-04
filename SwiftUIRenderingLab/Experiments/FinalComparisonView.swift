import SwiftUI

struct FinalComparisonView: View {

    @State private var parentCount = 0
    @State private var localCount = 0
    @State private var equatableValue = 0
    @State private var identity = 0

    var body: some View {

        ScrollView {

            VStack(spacing: 20) {

                Text("Final Comparison")
                    .font(.title2)
                    .bold()

                Text("Controlled comparison of SwiftUI body evaluations")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                Divider()

                // MARK: Parent Update

                VStack(spacing: 10) {

                    Text("1. Parent Update")
                        .font(.headline)

                    Text("Parent Count: \(parentCount)")

                    Button("Update Parent") {

                        RenderLogger.reset()

                        parentCount += 1

                        DispatchQueue.main.async {

                            print("=== FINAL: Parent Update ===")

                            print(
                                "RenderingExperimentView:",
                                RenderLogger.count(
                                    for: "FinalComparisonView"
                                )
                            )

                            print(
                                "CounterView:",
                                RenderLogger.count(
                                    for: "CounterView"
                                )
                            )

                            print(
                                "StaticView:",
                                RenderLogger.count(
                                    for: "StaticView"
                                )
                            )
                        }
                    }
                    .buttonStyle(.bordered)
                }

                Divider()

                // MARK: Local State

                VStack(spacing: 10) {

                    Text("2. Local @State Update")
                        .font(.headline)

                    Text("Local Count: \(localCount)")

                    Button("Update Local State") {

                        RenderLogger.reset()

                        localCount += 1

                        DispatchQueue.main.async {

                            print("=== FINAL: Local State ===")

                            print(
                                "FinalComparisonView:",
                                RenderLogger.count(
                                    for: "FinalComparisonView"
                                )
                            )

                            print(
                                "CounterView:",
                                RenderLogger.count(
                                    for: "CounterView"
                                )
                            )
                        }
                    }
                    .buttonStyle(.bordered)
                }

                Divider()

                // MARK: Equatable

                VStack(spacing: 10) {

                    Text("3. Equatable")
                        .font(.headline)

                    Text("Value: \(equatableValue)")

                    Button("Change Equatable Value") {

                        RenderLogger.reset()

                        equatableValue += 1

                        DispatchQueue.main.async {

                            print("=== FINAL: Equatable ===")

                            print(
                                "FinalComparisonView:",
                                RenderLogger.count(
                                    for: "FinalComparisonView"
                                )
                            )

                            print(
                                "EquatableCounterView:",
                                RenderLogger.count(
                                    for: "EquatableCounterView"
                                )
                            )
                        }
                    }
                    .buttonStyle(.bordered)
                }

                Divider()

                // MARK: Identity

                VStack(spacing: 10) {

                    Text("4. View Identity")
                        .font(.headline)

                    Text("Identity: \(identity)")

                    Button("Change Identity") {

                        RenderLogger.reset()

                        identity += 1

                        DispatchQueue.main.async {

                            print("=== FINAL: Identity ===")

                            print(
                                "FinalComparisonView:",
                                RenderLogger.count(
                                    for: "FinalComparisonView"
                                )
                            )

                            print(
                                "CounterView:",
                                RenderLogger.count(
                                    for: "CounterView"
                                )
                            )
                        }
                    }
                    .buttonStyle(.bordered)
                }

                CounterView(
                    parentCount: parentCount,
                    identity: identity
                )
                .id(identity)

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

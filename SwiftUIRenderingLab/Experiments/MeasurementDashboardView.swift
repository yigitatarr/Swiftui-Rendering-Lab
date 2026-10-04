import SwiftUI

struct MeasurementDashboardView: View {

    @ObservedObject private var store = RenderMeasurementStore.shared

    private let trackedViews = [
        "RenderingExperimentView",
        "CounterView",
        "StaticView",
        "EquatableCounterView",
        "AnyViewExperimentView",
        "NormalContentView",
        "AnyViewContentView"
    ]

    var body: some View {

        VStack(spacing: 16) {

            Text("Measurement Dashboard")
                .font(.title2)
                .bold()

            Text("Live Body Evaluation Counts")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            ScrollView {

                VStack(spacing: 12) {

                    ForEach(
                        trackedViews,
                        id: \.self
                    ) { viewName in

                        MeasurementRow(
                            viewName: viewName,
                            count: store.count(for: viewName)
                        )
                    }
                }
                .padding(.horizontal)
            }

            Button("Reset Measurements") {

                store.reset()

            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct MeasurementRow: View {

    let viewName: String
    let count: Int

    var body: some View {

        HStack {

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(viewName)
                    .font(.headline)

                Text("body evaluations")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text("\(count)")
                .font(.title3)
                .bold()
        }
        .padding()
        .background(
            RoundedRectangle(
                cornerRadius: 12
            )
            .fill(
                Color(.secondarySystemBackground)
            )
        )
    }
}

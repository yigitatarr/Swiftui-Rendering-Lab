import SwiftUI

struct EquatableCounterView: View, Equatable {

    let value: Int

    static func == (
        lhs: EquatableCounterView,
        rhs: EquatableCounterView
    ) -> Bool {
        lhs.value == rhs.value
    }

    var body: some View {
        RenderLogger.log("EquatableCounterView")

        return VStack(spacing: 8) {
            Text("Equatable View")
                .font(.headline)

            Text("Value: \(value)")
        }
        .padding()
    }
}

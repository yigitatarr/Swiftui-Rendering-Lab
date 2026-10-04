import SwiftUI

struct ContentView: View {

    var body: some View {

        TabView {

            MeasurementDashboardView()
                .tabItem {
                    Label(
                        "Dashboard",
                        systemImage: "chart.bar"
                    )
                }

            RenderingExperimentView()
                .tabItem {
                    Label(
                        "Rendering",
                        systemImage: "rectangle.on.rectangle"
                    )
                }

            FinalComparisonView()
                .tabItem {
                    Label(
                        "Final",
                        systemImage: "flask"
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}

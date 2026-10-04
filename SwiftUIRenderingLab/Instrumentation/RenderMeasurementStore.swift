import Combine

final class RenderMeasurementStore: ObservableObject {

    static let shared = RenderMeasurementStore()

    @Published private(set) var evaluations: [String: Int] = [:]

    private init() {}

    // MARK: - Recording

    func recordEvaluation(for viewName: String) {
        evaluations[viewName, default: 0] += 1
    }

    // MARK: - Reading

    func count(for viewName: String) -> Int {
        evaluations[viewName, default: 0]
    }

    // MARK: - Reset

    func reset() {
        evaluations.removeAll()
    }
}

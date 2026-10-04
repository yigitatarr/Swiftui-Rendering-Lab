# SwiftUI Rendering Lab

> **Status:** Experimental research project — core experiments completed.

A SwiftUI research project exploring `body` evaluation, state changes, view identity, `Equatable`, and `AnyView` through controlled experiments.

## Research Focus

* `body` evaluation
* `@State` and parent → child updates
* View identity and `.id()`
* `Equatable` / `.equatable()`
* `AnyView`
* Runtime measurement

## Methodology

Each experiment follows a controlled process:

```text
Reset → Perform one state change → Measure → Compare → Conclude
```

Measurements are collected with a lightweight instrumentation layer and displayed in an in-app dashboard.

## Key Results

| Experiment                  | Observation                               |
| --------------------------- | ----------------------------------------- |
| Local `@State`              | Local view evaluated                      |
| Parent update               | Dependent child evaluated                 |
| `.id()` change              | State lifetime reset                      |
| `Equatable` — same value    | No observed evaluation                    |
| `Equatable` — changed value | Body evaluated                            |
| `AnyView` toggle            | No observable difference in this scenario |

> **Note:** This project measures `body` evaluations, not actual rendering, GPU work, frame rate, or overall performance.

## Limitations

Results reflect the tested configuration and should not be treated as universal rules about SwiftUI's internal implementation. Deeper performance analysis would require tools such as Instruments.

## Setup

1. Open the project in Xcode.
2. Select an iPhone Simulator.
3. Build and run.
4. Use the **Dashboard** to inspect measurements.

**Requirements:** Xcode with SwiftUI support and an iOS Simulator.

## Purpose

**Measure first. Interpret second.**

## Future Work

* Instruments-based measurements
* `ForEach` identity
* `@ObservedObject` / `@StateObject`
* Environment updates
* CPU and memory analysis

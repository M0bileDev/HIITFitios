# HIITFit 🏋️

A native iOS fitness app built with **SwiftUI** that guides users through High Intensity Interval Training (HIIT) workouts and tracks progress over time.

> 📚 Built as a learning project following the **SwiftUI Apprentice** book by Kodeco (Ray Wenderlich).

---

## Features

- 🏃 **Exercise Browser** — browse and follow guided HIIT exercises
- ⏱️ **Workout Timer** — interval-based countdown timer to keep you on pace
- 📊 **History & Charts** — visualize completed workouts and track your progress over time
- ⭐ **Exercise Ratings** — rate exercises with ratings stored via `@AppStorage`
- 💾 **Scene Restoration** — save and restore workout state per scene using `@SceneStorage`
- ⚠️ **Error Handling** — display user-friendly alerts when errors occur

---

## Tech Stack

| Technology | Usage |
|---|---|
| SwiftUI | Entire UI layer |
| Swift Charts | Workout history visualization |
| @AppStorage | Persist exercise ratings in UserDefaults |
| @SceneStorage | Per-scene state restoration |

---

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/M0bileDev/HIITFitios.git
   ```

2. Open the project in Xcode:
   ```bash
   open HIITFit.xcodeproj
   ```

3. Select a simulator or a real device and hit **Run** (`⌘R`).

---

## Purpose

This project was developed as a hands-on learning exercise to practice SwiftUI fundamentals including state management, navigation, custom views, data persistence, and data visualization with Swift Charts.

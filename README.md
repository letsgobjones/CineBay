
# CineBay 🎬

CineBay is an iOS application built with SwiftUI that empowers users to discover, manage, and review their favorite movies, actors, and their connections. It serves as a personal, organized hub for all things cinema.

## Features

- **Comprehensive Movie Management:**
    - Effortlessly add new movies to your personal database.
    - View detailed information for each movie.
    - Filter and sort movies based on various criteria (e.g., title, review count).
    - Establish and manage relationships between movies and actors.
    - Keep track of key movie details like release year.

- **Integrated Actor Management:**
    - Add and catalog actors within the app.
    - Seamlessly link actors to the movies they've starred in.
    - View detailed actor profiles and the complete list of their associated films.

- **Robust Review System:**
    - Write and save your own reviews for any movie in your collection.
    - Easily access and read all reviews associated with a specific movie.
    - Gain insights into the number of reviews a movie has received.

- **Intuitive User Interface:**
    - Modern and declarative UI built with SwiftUI for a smooth and responsive experience.
    - Consistent design patterns for easy navigation.
    - Utilizes `NavigationStack` for a clear and manageable navigation flow.
    - Employs `List` views for efficient display of movie and review data.
    - Leverages `NavigationLink` for seamless transitions between views.
    - Uses `Sheet` and modal presentations for focused tasks like adding or viewing details.
    - Provides informative "No Reviews" and potentially other "Content Unavailable" states with helpful messages.

## Technical Stack

- **Core UI Framework:**
    - **SwiftUI**: Apple's modern, declarative UI framework for building user interfaces across all Apple platforms.

- **Data Persistence:**
    - **SwiftData**: Apple's advanced persistence framework providing an intuitive way to model and manage app data.

- **Concurrency:**
    - **Swift Concurrency**: Utilizes modern Swift features like `async/await` and `Task` for efficient handling of asynchronous operations, particularly during preview data loading.

- **Dependency and State Management:**
    - **Environment Values (`@Environment`)**: Used for dependency injection, making services like `AppManager` accessible throughout the view hierarchy.
    - **Environment Objects (`@EnvironmentObject` - Implicitly through `AppManager`)**: Likely used for managing shared application state and data.

- **Navigation:**
    - **NavigationStack**: Provides a structured way to manage hierarchical navigation within the app.
    - **NavigationLink**: Enables programmatic navigation to detailed views.

- **UI Components:**
    - **List**: For displaying collections of data (movies, reviews, actors).
    - **ForEach**: For iterating over data collections and creating dynamic views.
    - **Text**: For displaying textual information.
    - **VStack/HStack**: For arranging views vertically and horizontally.
    - **Button**: For user interactions.
    - **Label**: For providing context to UI elements.
    - **ContentUnavailableView**: For gracefully handling scenarios where data is not available.

- **Data Handling:**
    - **`@Query`**: SwiftUI property wrapper for fetching and observing SwiftData managed objects.
    - **`Predicate`**: Used to define filtering criteria for SwiftData queries.
    - **`@Relationship`**: SwiftData property wrapper for defining relationships between managed objects (movies, actors, reviews) with specified delete rules (`.cascade`, `.nullify`).

- **Formatting:**
    - `.formatted(.list(type: .and))`: Used for creating human-readable lists of strings (e.g., actor names).

## Architecture & Patterns

- **Model-View-ViewModel (MVVM):**
    - Likely employs the MVVM architectural pattern to separate the UI (`View`) from the application logic and data (`ViewModel` - potentially within `AppManager` and Store classes).
    - **Store Pattern:** A dedicated `AppManager` likely acts as a central store or service layer, encapsulating data management logic (e.g., `movieStore`, `reviewStore`).
    - **Environment-based Dependency Injection:** The use of `@Environment` facilitates making the `AppManager` and its services available to views without tight coupling.

- **Data Models:**
    - **`Movie`**: Represents movie entities with properties like `title`, `year`, and relationships to `Review` and `Actor`.
    - **`Actor`**: Represents actor entities with a `name` and a relationship to `Movie`.
    - **`Review`**: Represents movie reviews with properties like `subject`, `body`, and a relationship to the associated `Movie`.

## Skills Demonstrated

1. **Proficient SwiftUI Development:**
    - Creating custom and reusable view components (`MovieListCellView`, `ReviewListCellView`, `ActorCellView`).
    - Implementing dynamic list views using `ForEach` and managing data flow.
    - Presenting modal views and sheets for adding/editing data.
    - Customizing toolbars and navigation elements.
    - Handling user input and interactions within SwiftUI views.
    - Implementing conditional views based on data availability.

2. **Advanced Data Management with SwiftData:**
    - Seamless integration of SwiftData for persistent data storage.
    - Defining and managing complex relationships between data models (`@Relationship`).
    - Performing efficient data fetching and observation using `@Query`.
    - Implementing data filtering using `Predicate`.
    - Understanding and applying SwiftData's delete rules for data integrity.

3. **Effective UI/UX Implementation:**
    - Designing a clean, intuitive, and user-friendly interface.
    - Maintaining consistent design patterns throughout the application.
    - Utilizing modal and sheet presentations for focused user tasks.
    - Creating clear and informative list views and detailed information screens.
    - Providing feedback to the user in scenarios with no data (`ContentUnavailableView`).

4. **Modern Swift Features Utilization:**
    - Leveraging enums for defining type-safe options and states.
    - Utilizing property wrappers (`@Environment`, `@Query`, `@Relationship`) for concise and declarative code.
    - Implementing dependency injection using `@Environment` and potentially `@EnvironmentObject`.
    - Utilizing Swift Concurrency features (`async/await`, `Task`) for asynchronous operations.

## Requirements

- iOS 17.0+ (Minimum deployment target)
- Xcode 15.0+ (Development environment)
- Swift 5.9+ (Programming language version)

## Getting Started

1. Clone the repository to your local machine using `git clone <https://github.com/letsgobjones/CineBay>`.
2. Open the `CineBay.xcodeproj` file in Xcode.
3. Build (`Cmd + B`) and run (`Cmd + R`) the project on a simulator or a physical iOS device.

## Future Enhancements

- Implement image support for movies and actors (e.g., using `AsyncImage`).
- Add more advanced and customizable filtering and sorting options for movies and actors.
- Integrate search functionality to quickly find movies and actors by name or other criteria.
- Implement data sharing capabilities (e.g., sharing movie details or reviews).
- Explore integration with external movie databases (like TMDb) to fetch additional movie information and artwork.
- Implement user authentication and personalized features.
- Add rating functionality for movies.

## License

This project is available under the MIT license. See the `LICENSE` file for more information.

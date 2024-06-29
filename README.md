# 
# Flutter BLoC + graphql_flutter + GetIt Example

This Flutter application is an example of how to implement BLoC (Business Logic Component) for state management, graphql_flutter as the graphql client for API communication, and GetIt for dependency injection. In this example, we fetch GitHub repositories from the GitHub API.




## Architecture Overview

    
-   **BLoC (Business Logic Component):** BLoC is used for managing the application's state. It contains the logic to fetch and handle data from the API. The BLoC communicates with the repository.
    
-   **graphql_flutter (API Client):** graphql_flutter is used to make graphql API requests to the GitHub API. It provides a convenient way to define API endpoints and data models.
    
-   **GetIt:** GetIt is used for dependency injection. It is used to provide instances of the repository and BLoC to the UI components.
    

## Folder Structure

The project is structured as follows:

-   `lib/`
    -   `core/`: Contains the constants and errors handler.
    -   `data/`: Contains the data layer, including data models and remote.
    -   `di.dart`: Contains the dependency injection file.
    -   `domain/`: Contains the Entities, repositories, and use cases.
    -   `presentation/`: Contains screens, widgets and BLoCs
    -   `main.dart`: The entry point of the application. 

## Dependencies

-   [flutter](https://pub.dev/packages/flutter)
-   [graphql_flutter](https://pub.dev/packages/graphql_flutter)
-   [get_it](https://pub.dev/packages/get_it)
-   [bloc](https://pub.dev/packages/flutter_bloc)
-   [go_router](https://pub.dev/packages/go_router)
# InkWell News App

## Overview

InkWell is a sophisticated Flutter news application that employs the CLEAN architecture pattern. This project focuses on clean and modular code, incorporating Material Design 3 principles for an aesthetically pleasing user experience. Utilizing the GetX library for efficient state management and NewsAPI for real-time news updates, InkWell is designed to be a versatile and user-friendly news platform.

## Features

- **Clean Architecture:** InkWell follows the CLEAN architecture pattern, promoting a modular and scalable codebase. The separation of concerns enhances maintainability and testability.

- **GetX for State Management:** The app utilizes GetX, a reactive state management library for Flutter, providing a straightforward way to manage and update the app's state efficiently.

- **Material Design 3:** InkWell embraces the latest Material Design 3 guidelines, ensuring a modern and visually appealing user interface. The app offers a seamless and intuitive experience for users.

- **NewsAPI Integration:** InkWell fetches real-time news data from the NewsAPI, providing users with up-to-date information on various topics. This integration ensures a dynamic and engaging user experience.

- **App Name:** InkWell

- **Tagline:** "Sink your inkwell deep, with news that flows and stories that matter."

## Project Setup

Follow these steps to set up and run InkWell on your local machine:

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/majumdersubhanu/inkwell.git
    ```

2. **Navigate to the Project Directory:**

    ```bash
    cd inkwell
    ```

3. **Install Dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the App:**

    ```bash
    flutter run
    ```

## Project Structure

The project structure is organized following the CLEAN architecture pattern, enhancing code readability and maintainability. Here's an overview of the directory structure:

- **data:** Contains data sources and repositories for handling data operations.
    - **remote:** Manages the remote data source, such as API calls.
    - **local:** Handles local data storage operations.
- **domain:** Defines the business logic and entities of the application.
- **presentation:** Contains the UI layer and is responsible for displaying data to the user.
    - **pages:** Represents individual pages/screens of the app.
    - **widgets:** Houses reusable UI components.
    - **bindings:** Manages dependency injection for each page.
- **application:** Bridges the gap between the presentation layer and the domain layer.
    - **usecases:** Defines specific use cases for the app.
- **injection:** Handles dependency injection using GetX bindings.
- **main.dart:** Entry point of the application.

Feel free to explore and customize InkWell to meet your specific requirements. If you encounter any issues or have questions, refer to the official documentation or open an issue on the GitHub repository.

Happy coding!

---

**Note:** For more detailed instructions or troubleshooting, please refer to the official documentation or open an issue on the [GitHub repository](https://github.com/Katekko/ekko_app).

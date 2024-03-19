# Bizcotap Mobile Application

Welcome to the Bizcotap mobile application README. This document provides a clear and concise overview for developers on how to use the app, its folder structure, and key components.

## Table of Contents

1. [Getting Started](#getting-started)
   1. [Clone the Repository](#clone-the-repository)
   2. [Install Dependencies](#install-dependencies)
2. [Folder Structure](#folder-structure)
   1. [lib/](#lib)
   2. [Data](#data)
   3. [Helpers](#helpers)
   4. [Screens](#screens)
   5. [Values](#values)
   6. [Widgets](#widgets)
3. [Main](#main)

## 1. Getting Started <a name="getting-started"></a>

### 1.1. Clone the Repository <a name="clone-the-repository"></a>

To begin, clone this repository using the following command:

```bash
git clone https://gitlab.com/me-consulting-group/bizcotap.git
```
### 1.2. Change Directory
```bash
cd bizcotap
```
### 1.3. Install Dependencies <a name="install-dependencies"></a>

Navigate to the project root and execute the following command in the console to fetch the required dependencies:

```bash
flutter pub get 
```

## 2. Folder Structure <a name="folder-structure"></a>

Here is the consistent and organized folder structure used in the Bizcotap mobile application:

### 2.1. lib/ <a name="lib"></a>

The `lib` directory is the core of the application, containing essential code and components:

```
lib/
|- data/
|- helpers/
|- screens/
|- values/
|- widgets/
|- main.dart
|- my_app.dart
```

### 2.2. Data <a name="data"></a>

The "data" directory plays a crucial role in managing data-related components within the application. It comprises several subfolders, each with a specific purpose:

```
data/
|- api/
|- enums/
|- mocks/
|- models/
|- providers/
```

#### 2.2.1. api <a name="api"></a>

The "api" subfolder is dedicated to managing data communication with external sources, typically through APIs. It contains modules for making network requests, parsing responses, and handling endpoints.

#### 2.2.2. enums <a name="enums"></a>

In the "enums" subfolder, you can define enumerations representing specific states, types, or options within your application. Enums enhance code clarity by providing named constants for various scenarios.

#### 2.2.3. mocks <a name="mocks"></a>

The "mocks" subfolder is essential for testing and development. It often contains mock data or mock implementations of data sources to facilitate offline testing and prototyping.

#### 2.2.4. models <a name="models"></a>

Within the "models" subfolder, you define data models that represent the structure of the application's data. These models specify how data is structured, parsed, and utilized within the app.

#### 2.2.5. providers <a name="providers"></a>

The "providers" subfolder houses classes or modules responsible for state management. Riverpod state management library is used to manage states in this application.

### 2.3. Helpers <a name="helpers"></a>

The "helpers" directory contains utility files that simplify various tasks throughout your Flutter application. Here's the consistent structure within this directory:

```
helpers/
|- utils.dart
|- custom_widgets.dart
|- api_helpers.dart
```

### 2.4. Screens <a name="screens"></a>

The "screens" directory serves as the organizational hub for various screens or pages within the application. Here are some examples of screen files:

```
screens/
|- home_screen.dart
|- login_screen.dart
```

#### 2.4.1. home_screen.dart <a name="home-screen"></a>

The `home_screen.dart` file represents the primary screen of your app, serving as the home page. It defines the overall structure and layout for your app's main interface.

#### 2.4.2. login_screen.dart <a name="login-screen"></a>

The `login_screen.dart` file is where users can sign in to their accounts. It handles user authentication and access to secure areas of your app.

### 2.5. Values <a name="values"></a>

The "values" directory serves as a centralized repository for constants, styles, and resources used throughout your Flutter application:

```
values/
|- assets/
|   |- asset_paths.dart
|- colors.dart
|- constants.dart
|- dimens.dart
|- styles.dart
```

#### 2.5.1. assets/asset_paths.dart <a name="asset-paths"></a>

The `asset_paths.dart` file contains path constants to assets like images, icons, fonts, and other resources used in your app. Centralizing asset paths simplifies resource management.

#### 2.5.2. colors.dart <a name="colors"></a>

In the `colors.dart` file, you define color constants used consistently throughout your app's user interface. These constants maintain a unified color scheme and can be easily updated.

#### 2.5.3. constants.dart <a name="constants"></a>

The

 `constants.dart` file holds general-purpose constants that are not specific to colors, text styles, or dimensions. This includes items like API endpoints, configuration values, or any other global constants.

### 2.6. Widgets <a name="widgets"></a>

The "widgets" directory contains common widgets shared across multiple screens, promoting reusability:

```
widgets/
|- button.dart
|- app_bar.dart
```

## 3. Main <a name="main"></a>

The `main.dart` file serves as the starting point of the application. It defines application-level configurations, including themes, routes, titles, orientations, and more.

The `my_app.dart` file contains code segments called within the `runApp` function in `main.dart`, facilitating application initialization.

This README offers a concise overview of our project structure and key components. Explore the specific folders and files for more details on how they are implemented in the Bizcotap mobile application.

## 4. Branch Naming Convention
This project follows this branching model for development;

```[code name of the jira ticket]-[name of branch in relation to the jira ticket]``` 

**Example**
If you are working on a feature that is related with https://bizcotap.atlassian.net/browse/BMA-10. 

The jira code is `BMA-10` so the branch name will be `bma-10-resolve-dependency-issues`. *The description just came from the name of the ticket*
# 🇮🇳 Travel India

> **An India-focused travel discovery application built with Flutter, Firebase, Google Maps and OpenStreetMap data.**

Travel India is a Flutter-based mobile application designed to help users discover and explore destinations across India from a single platform.

The application provides information about **Indian states, tourist places, hotels, restaurants and airports**, with location-based data displayed through interactive maps.

The project follows a **feature-based Clean Architecture approach** with **BLoC state management**, separating presentation, domain, data and networking responsibilities.

---

## ✨ Features

### 🗺️ Explore Indian States

* Browse different states of India.
* View state-specific information.
* Navigate from a state to its available travel resources.
* Explore destinations based on the selected state.

### 📍 Tourist Places

* Discover tourist attractions and places to visit.
* Fetch place information dynamically from OpenStreetMap data.
* Display geographical information for discovered locations.
* View places directly on an interactive map.

### 🏨 Hotels

* Discover hotels available around a selected state/location.
* Fetch hotel information dynamically.
* Display hotel locations using Google Maps.
* Uses OpenStreetMap/Overpass data instead of relying exclusively on commercial place APIs.

### 🍴 Restaurants

* Discover restaurants and food locations.
* Filter restaurants using categories such as:

  * Restaurants
  * Cafes
  * Fast Food
  * Food Courts
* Display restaurant locations on the map.

### ✈️ Airports

* Discover airports associated with different Indian regions.
* Fetch airport information through the application data layer.
* Display airport locations geographically.

### 🔐 Authentication

* Firebase Authentication integration.
* Google Sign-In support.
* Authentication state managed through BLoC.
* Separate authentication data, domain and presentation layers.

### ☁️ Cloud Data

* Firebase Firestore integration.
* Cloudinary integration for image management.
* Cached network images for improved image loading performance.

### 🗺️ Interactive Maps

* Google Maps integration.
* Location markers for hotels, restaurants, airports and places.
* Geographical coordinates obtained from API data.
* State-based map navigation.

---

## 🏗️ Architecture

Travel India follows a **feature-based Clean Architecture** structure.

```text
lib/
│
├── Config/
│   └── Theme/
│
├── features/
│   │
│   ├── airports_page/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── home_page/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── hotels_page/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── places_page/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── restaurants_page/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── state_page/
│       └── presentation/
│
├── networks/
│   ├── network_constants.dart
│   ├── network_exception.dart
│   └── overpass_client.dart
│
└── main.dart
```

The repository currently contains separate feature modules for airports, authentication, home, hotels, places, restaurants and state presentation.

---

## 🔄 Application Architecture

The application follows the flow:

```text
┌───────────────────────────────┐
│          Flutter UI           │
│        Pages / Widgets        │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│          BLoC Layer           │
│       State Management        │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│          Use Cases            │
│       Business Logic          │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│         Repository            │
│      Abstract Data Access     │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│        Data Sources           │
│ Firebase / Overpass / APIs    │
└───────────────────────────────┘
```

This structure keeps UI logic, business logic, repository implementations and external data sources separated.

---

## 🛠️ Tech Stack

| Technology                       | Purpose                                |
| -------------------------------- | -------------------------------------- |
| **Flutter**                      | Cross-platform application development |
| **Dart**                         | Programming language                   |
| **BLoC / flutter_bloc**          | State management                       |
| **Firebase Authentication**      | User authentication                    |
| **Cloud Firestore**              | Cloud database                         |
| **Google Sign-In**               | Social authentication                  |
| **Cloudinary**                   | Image management                       |
| **Google Maps Flutter**          | Interactive maps                       |
| **OpenStreetMap / Overpass API** | Location and POI data                  |
| **HTTP**                         | API communication                      |
| **Geocoding**                    | Location/address conversion            |
| **Cached Network Image**         | Image caching                          |
| **Intl**                         | Formatting and localization utilities  |

These dependencies are present in the project's current `pubspec.yaml`.

---

## 🌐 API & Data Layer

A major part of Travel India is its use of **OpenStreetMap data through the Overpass API**.

Instead of depending completely on commercial location APIs, the application uses a dedicated networking layer:

```text
Flutter Feature
      │
      ▼
Repository
      │
      ▼
Data Source
      │
      ▼
OverpassClient
      │
      ▼
Overpass API
      │
      ▼
OpenStreetMap Data
```

The project contains a reusable `OverpassClient` along with network constants and exception handling under `lib/networks`.

This approach allows the application to query geographical information such as:

* Hotels
* Restaurants
* Airports
* Tourist places
* Coordinates
* OpenStreetMap tags

---

## 🔥 Firebase Integration

Firebase is used for application-level backend functionality.

### Firebase Authentication

Used for:

* User login
* Authentication state
* Google Sign-In
* User session management

### Cloud Firestore

Used for storing and retrieving application data associated with the home experience.

The authentication and home features are separated into their respective `data`, `domain` and `presentation` layers.

---

## 🗺️ Maps

Google Maps is integrated into the application to provide geographical visualization.

Location data retrieved from external APIs can be converted into map markers and displayed to users.

Example flow:

```text
API Response
     ↓
Model
     ↓
Repository
     ↓
Use Case
     ↓
BLoC
     ↓
UI
     ↓
Google Maps Marker
```

---

## 📱 Screens / Modules

The application is divided into multiple independent features:

### Authentication

Responsible for login and authentication-related functionality.

### Home

Acts as the central discovery area of the application.

### State

Allows users to select and explore different Indian states.

### Places

Provides information about tourist destinations.

### Hotels

Provides hotel discovery for selected locations.

### Restaurants

Provides restaurant and food-location discovery.

### Airports

Provides airport discovery and geographical information.

---

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android SDK
* Git

The current project specifies Dart SDK `^3.10.1` in `pubspec.yaml`.

### 1. Clone the repository

```bash
git clone https://github.com/Aditya073/travel_india.git
```

### 2. Navigate into the project

```bash
cd travel_india
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Configure Firebase

Configure Firebase for your target platform and make sure the required Firebase configuration files are present.

The repository currently contains Firebase configuration support and initializes Firebase from the application entry point.

### 5. Configure Google Maps

Add your Google Maps API key according to the Android/iOS platform configuration.

### 6. Run the application

```bash
flutter run
```

---

## 📂 Project Structure

```text
travel_india/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── assets/
│   └── images/
│
├── lib/
│   ├── Config/
│   │
│   ├── features/
│   │   ├── airports_page/
│   │   ├── auth/
│   │   ├── home_page/
│   │   ├── hotels_page/
│   │   ├── places_page/
│   │   ├── restaurants_page/
│   │   └── state_page/
│   │
│   ├── networks/
│   │   ├── network_constants.dart
│   │   ├── network_exception.dart
│   │   └── overpass_client.dart
│   │
│   └── main.dart
│
├── test/
├── firebase.json
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

---

## 🎯 Project Goals

The main goals of Travel India are:

* Make discovering Indian destinations easier.
* Provide travel-related information in one application.
* Practice scalable Flutter application architecture.
* Implement real-world API integration.
* Use open geographical data through OpenStreetMap.
* Implement state management using BLoC.
* Integrate Firebase-based authentication and cloud services.
* Provide an interactive map-based travel experience.

---

## 🔮 Future Improvements

Planned improvements can include:

* [ ] Trip planning and itinerary creation
* [ ] Personalized travel recommendations
* [ ] Hotel and restaurant reviews
* [ ] Favorite/bookmark functionality
* [ ] Advanced search and filtering
* [ ] Distance-based location sorting
* [ ] Offline caching
* [ ] Improved API caching and rate-limit handling
* [ ] Weather information for destinations
* [ ] Public transport information
* [ ] Travel expense tracking
* [ ] Push notifications
* [ ] More detailed place information
* [ ] Automated testing
* [ ] CI/CD with GitHub Actions

---

## 🧪 Testing

The project contains a dedicated `test/` directory and can be tested using:

```bash
flutter test
```

Static analysis can be performed using:

```bash
flutter analyze
```

---

## 🤝 Contributing

Contributions, suggestions and improvements are welcome.

1. Fork the repository.
2. Create a new branch.

```bash
git checkout -b feature/your-feature
```

3. Make your changes.
4. Commit your changes.

```bash
git commit -m "feat: add your feature"
```

5. Push the branch.

```bash
git push origin feature/your-feature
```

6. Open a Pull Request.

---

## 📸 Screenshots

> Add screenshots of the application here.

Recommended screenshots:

* Login screen
* Home screen
* State selection
* Tourist places
* Hotels
* Restaurants
* Airports
* Google Maps view

Example:

```text
screenshots/
├── login.png
├── home.png
├── states.png
├── places.png
├── hotels.png
├── restaurants.png
└── map.png
```

---

## 👨‍💻 Author

**Aditya Dixit**

GitHub: [@Aditya073](https://github.com/Aditya073)

Project: [Travel India](https://github.com/Aditya073/travel_india)

---

## ⭐ Support

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.

---

## 📄 License

This project is currently intended as a personal/academic project.

A formal open-source license can be added in the future if the project is released for community contribution.

# Languo - Language Translator

## Overview
Languo is a sleek, user-friendly Flutter application that enables real-time text translation between multiple languages. The app provides a clean interface for translating text with support for 7 major languages, making it a handy tool for quick translations on the go.

## Features

### Core Functionality
- **Multi-language Support**: Translate between 7 languages including:
  - English
  - Spanish
  - French
  - German
  - Chinese
  - Japanese
  - Russian

- **Real-time Translation**: Get instant translations with Google's powerful translation API
- **Intuitive UI**: Clean, material design interface for seamless user experience
- **Responsive Design**: Works on multiple screen sizes and orientations

## Technical Architecture

### Tech Stack
- **Framework**: Flutter
- **Backend**: Google Translate API
- **State Management**: Flutter's built-in setState
- **UI Components**: Material Design

### Key Components
1. **Main Application (`main.dart`)**
   - Application entry point
   - Sets up the MaterialApp with theme and routing
   - Initializes the main translation page

2. **Translation Page (`language_translation.dart`)**
   - Manages UI state and user interactions
   - Handles language selection and translation logic
   - Implements the translation service integration

3. **Dependencies**
   - `translator: ^1.0.3+1` - For Google Translate API integration
   - `flutter_lints: ^5.0.0` - For code quality and linting
   - `flutter_launcher_icons: ^0.13.1` - For custom app icons

## Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Android Studio / Xcode (for emulator/simulator)
- An internet connection (for translation services)

### Installation
1. Clone the repository
   ```bash
   git clone [repository-url]
   cd language_translator
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Run the application
   ```bash
   flutter run
   ```

## Usage Guide

1. **Select Source Language**
   - Tap the first dropdown to choose the language of your input text

2. **Select Target Language**
   - Tap the second dropdown to choose the language you want to translate to

3. **Enter Text**
   - Type or paste the text you want to translate in the input field

4. **Translate**
   - Tap the "Translate" button to see the translation
   - The translated text will appear below the button

## Code Structure

```
lib/
├── main.dart              # Application entry point
├── language_translation.dart  # Main translation logic and UI
pubspec.yaml              # Dependencies and project configuration
assets/                   # Static assets (images, fonts, etc.)
```

## Error Handling
- The application includes basic error handling for:
  - Empty input fields
  - Unselected languages
  - Network connectivity issues

## Future Enhancements
- Add more languages
- Implement text-to-speech for translations
- Add translation history
- Support for offline translations
- Dark/light theme toggle
- Share functionality for translations

## Dependencies
- Flutter SDK: ^3.8.1
- translator: ^1.0.3+1
- flutter_lints: ^5.0.0
- flutter_launcher_icons: ^0.13.1

## License
[Specify License Type]

## Contributing
[Contribution guidelines if applicable]

## Support
For support, please [provide contact information or link to issues page]

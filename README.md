# FitForge (PulseFlow)

A Flutter fitness application focused on guided workouts, progress tracking, account management, and reminder notifications.

This repository contains a complete cross-platform Flutter app with Firebase authentication and media-rich workout content.

## Highlights

- Onboarding flow for first-time users
- Firebase Authentication for sign up, sign in, and password management
- Home dashboard with workout progress and stats
- Workout catalog and workout details screens
- Start-workout experience with timers and workout videos
- Reminder scheduling via local notifications
- User account editing and settings pages
- Structured state management using flutter_bloc

## Tech Stack

- Flutter (Dart)
- Firebase Core, Firebase Auth, Firebase Storage
- flutter_bloc for state management
- video_player + chewie for exercise videos
- flutter_local_notifications + timezone for reminders
- image_picker for profile/image selection

## Project Structure

- lib/
  - core/
    - const/: app constants (colors, paths, text, sample data)
    - service/: auth, user, storage, validation, date, notifications
    - extensions/: utility extensions
  - data/: workout and exercise data
  - screens/: feature-first UI modules (onboarding, auth, home, workouts, settings, etc.)
  - main.dart: app entry point, Firebase initialization, theme setup
- assets/
  - fonts/, icons/, images/, videos/
- android/ and ios/
  - native platform configuration
- web/
  - web target files

## Prerequisites

- Flutter SDK installed
- Dart SDK (bundled with Flutter)
- Android Studio or VS Code with Flutter extension
- A Firebase project configured for the app

## Getting Started

1. Clone the repository.
2. Open the project in your editor.
3. Install dependencies:
   - flutter pub get
4. Ensure Firebase files are present and correct:
   - Android: android/app/src/google-services.json
   - iOS: ios/Runner/GoogleService-Info.plist
5. Run the app:
   - flutter run

## Common Commands

- flutter pub get
- flutter run
- flutter test
- flutter build apk
- flutter build ios
- flutter build web

## Configuration Notes

- App orientation is locked to portrait in main.dart.
- Notification initialization is configured at startup.
- The app checks FirebaseAuth current user to decide onboarding vs main tab flow.

## Screens and Flow

- Onboarding
- Sign In / Sign Up / Forgot Password
- Home
- Workouts
- Workout Details
- Start Workout (timer + video)
- Reminder
- Settings
- Edit Account / Change Password

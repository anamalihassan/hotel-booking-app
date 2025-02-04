# hotel_booking

Hotel Booking App

## Setup

The project is built using Flutter 3.24.3 using Android Studio Koala Feature Drop | 2024.1.2 Patch 1 and Xcode 16.2. The app runs fine on iOS 18.2 and Android API level 30.
The translations are included in the repository and no additional steps are needed to run the app.

## Project Hierarchy
The app is comprised of below structure:
- core: contains all the files related to constants, dependency injection, exception, theme, utils etc.
- features: contains clasess for bloc, models, repositories, screens and widgets. Commons folder should contain everything common in the features.
- l10n: includes arb translation files
- routes: navigation routes handling

## Architecture
The project used bloc pattern for state management. It can further be improved with`usecases` when we have complicated logic. 

## Networking
The app uses Dio client with retrofit to make backend calls. The client can be further improved based on requirements.

## Local Storage
The app uses `sembast` as local storage.

## Theme
The app uses theme to handle dark and light modes based on device.

## Localization
The app includes English and German translations. Locale is selected based on device.

## Testing
Basic unit tests are written for bloc logic.

<a href="https://github.com/stevecassidy/harry-potter-quiz-app/actions"><img src="https://github.com/stevecassidy/harry-potter-quiz-app/workflows/test-harry-potter/badge.svg" alt="Build Status"></a>

# Harry Potter Quiz App

Developed as an example for COMP3130 at Macquarie University.

## Adding Firebase

The following steps were followed to add Firebase Auth to this project.

- Set up a Firebase project via the Firebase console <https://console.firebase.google.com>
- Install the `firebase` command line tool <https://firebase.google.com/docs/cli>
- Login with the firebase cli: `firebase login`
- Install the flutterfire command line tools: `dart pub global activate flutterfire_cli`
- Configure your local project to link to the Firebase project you just created: `flutterfire configure`
  - this will ask you which platforms you want to configure and creates some configuration files in those sub-folders
- Add firebase auth to the project dependencies: `flutter pub add firebase_auth`
- Add the code to call the firebase auth services

## Testing Firebase

See the [FlutterFire](https://firebase.flutter.dev/docs/testing/testing/) website for some details on
testing with Firebase.


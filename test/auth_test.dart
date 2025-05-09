import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/screens/auth_screen/auth_widget.dart';

void main() {

  testWidgets('Login Form', (WidgetTester tester) async {

    final email = "test@example.com";
    final password = "password123";

    // Create a mock user
    final mockUser = MockUser(
      isAnonymous: false,
      uid: 'test-user-id',
      email: email,
      displayName: 'Test User',
    );

    // Create a mock auth provider
    final mockFirebaseAuth = MockFirebaseAuth(
      signedIn: false,
      mockUser: mockUser,
    );

    // no current user yet
    expect(mockFirebaseAuth.currentUser, null);

    await tester.pumpWidget(MaterialApp(home: AuthWidget(auth: mockFirebaseAuth)));

    final emailInputFinder = find.widgetWithText(TextField, "Email");
    final passwordInputFinder = find.widgetWithText(TextField, "Password");
    final loginButtonFinder = find.text("Login").last;

    await tester.enterText(emailInputFinder, email);
    await tester.enterText(passwordInputFinder, password);
    await tester.tap(loginButtonFinder);

    // on successful login, we have a current user
    expect(mockFirebaseAuth.currentUser?.email, email);
  });
}

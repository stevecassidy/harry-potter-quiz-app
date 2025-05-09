import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart' as Mokito;
import 'package:mockito/mockito.dart';
import 'package:quiz_app/screens/auth_screen/auth_widget.dart';
import 'firebase_test_helpers.dart';

void main() {

  setupFirebaseCoreMocks();

  testWidgets('Login Form', (WidgetTester tester) async {

    final email = mockUser.email!;
    final password = "password123";

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

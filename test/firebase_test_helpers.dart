import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';


class MockFirebaseApp extends Mock implements FirebaseApp {}

// Create a mock user
final mockUser = MockUser(
  isAnonymous: false,
  uid: 'test-user-id',
  email: 'test@example.com',
  displayName: 'Test User',
);

// Create a mock auth provider
final mockFirebaseAuth = MockFirebaseAuth(
  signedIn: false,
  mockUser: mockUser,
);

// Setup Firebase mocks
void setupFirebaseCoreMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
}

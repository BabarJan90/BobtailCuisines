import 'dart:async';
import 'package:bobtail_cuisines/src/services/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}
final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User?> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  LoginService _loginService = LoginService(auth: mockFirebaseAuth);
  setUp(() {});
  tearDown((){});

  test("emit occurs", () async {
    expectLater(_loginService.user, emitsInOrder([_mockUser]));
  });

  test("login", () async {
    Completer<UserCredential> completer = Completer<UserCredential>();
    Future<UserCredential> future = completer.future;

     when(_loginService.signInWithEmailAndPassword("m.babar@gmail.com", "babar123"))
         .thenAnswer((_)  =>  future);

    expect(await _loginService.signInWithEmailAndPassword("m.babar@gmail.com", "babar123"),  future);
  });
}
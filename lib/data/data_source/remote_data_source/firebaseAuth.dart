import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.userChanges();

  /// after getting the user cred
  /// must be mapped to [User] object
  Future<UserCredential> singInUser(
          {required String email, required String password}) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> registerUser({
    required String email,
    required String password,
    required String name,
    required String td,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Now that the user is created, you can add additional information to the database.
      await _updateUserProfile(cred.user!, name, td);

      return cred;
    } catch (e) {
      // Handle registration errors here
      print("Error during user registration: $e");
      throw e;
    }
  }

  Future<void> _updateUserProfile(User user, String name, String td) async {
    try {
      await user.updateDisplayName(name);
      // Store additional information in Firebase Realtime Database
      // await FirebaseFirestore.instance.collection('user_isimm').doc(user.uid).set({
      //   'name': name,
      //   'td': td,
      // });
    } catch (e) {
      // Handle profile update errors here
      print("Error updating user profile: $e");
      throw e;
    }
  }
}

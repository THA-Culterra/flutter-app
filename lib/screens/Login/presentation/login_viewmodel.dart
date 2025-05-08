import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../Country/data/models/role.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // To show loading or errors
  bool isLoading = false;
  String? errorMessage;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void clearError() {
    setError(null);
  }

  void setError(String? message) {
    errorMessage = message;
    notifyListeners();
  }

  // Google login/signup
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      _setLoading(true);
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _signInWithCredential(credential, context);
    } catch (e) {
      setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Apple login/signup
  Future<void> signInWithApple(BuildContext context) async {
    try {
      _setLoading(true);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      await _signInWithCredential(oauthCredential, context);
    } catch (e) {
      setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Facebook login/signup
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      _setLoading(true);
      final result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
        await _signInWithCredential(credential, context);
      } else {
        setError("Facebook login failed: ${result.message}");
      }
    } catch (e) {
      setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Email login/signup
  Future<void> signInWithEmail(String email, String password, BuildContext context) async {
    try {
      _setLoading(true);
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          await _auth.createUserWithEmailAndPassword(email: email, password: password);

          //TODO: Get user nationality and replace it here
          await saveUserData(nationality: "DE");
        } else {
          rethrow;
        }
      }

      // Navigate after a successful login/signup
      if (!context.mounted) return;  // Ensure the widget is still mounted
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } catch (e) {
      setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Common function to handle credential-based login/signup
  Future<void> _signInWithCredential(AuthCredential credential, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        // Check if the user exists in Firestore by checking the user's UID
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          // User does not exist in Firestore, create a new user
          await saveUserData(nationality: "DE");  // Replace with actual nationality if needed
        }

        // Navigate to the home screen after successful login or new user creation
        if (!context.mounted) return;  // Ensure the widget is still mounted
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
        }

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "an error occured"),
        ),
      );
    }
  }

  Future<void> saveUserData({
    required String nationality
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return; // Return early if there's no logged-in user

    // Prepare the user data to be saved to Firestore
    final userData = {
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
      'nationality': nationality,
      'phone': user.phoneNumber,
      'role': Role.explorer.name, // Store the role as a string
      'createdAt': FieldValue.serverTimestamp(), // Store the timestamp for when the user was created
    };

    try {
      // Save user data to the Firestore `users` collection using the user UID as the document ID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid) // Document ID is the user UID
          .set(userData, SetOptions(merge: true)); // Merge will keep existing data
    } catch (e) {
      // Handle any errors that occur during Firestore write
      print("Error saving user data to Firestore: $e");
    }
  }
}
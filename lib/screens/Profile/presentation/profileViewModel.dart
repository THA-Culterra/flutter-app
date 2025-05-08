import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/Material.dart';

import '../../Country/data/models/CulterraUser.dart';
import '../domain/entities/uiState.dart';

class ProfileViewModel extends ChangeNotifier {
  UiState<CulterraUser> userState = UiLoading();

  Future<void> getUserData() async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final culterraUser = CulterraUser.fromFirestore(user);
      userState = UiSuccess(culterraUser);
    } catch (e) {
      userState = UiError(e.toString());
    }
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      if (!context.mounted) return;

      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: ${e.toString()}")),
      );
    }
  }
}
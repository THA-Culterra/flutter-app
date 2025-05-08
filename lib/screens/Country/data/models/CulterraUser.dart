import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culterra/screens/Country/data/models/role.dart';

class CulterraUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;
  final String? phone;
  final String nationality;
  final Role role;

  CulterraUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
    required this.phone,
    required this.nationality,
    required this.role,
  });

  factory CulterraUser.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CulterraUser(
      uid: doc.id,
      email: data['email'],
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      phone: data['phone'],
      nationality: data['nationality'],
      role: Role.values.firstWhere(
            (r) => r.name == data['role'],
        orElse: () => Role.explorer,
      ),
    );
  }
}

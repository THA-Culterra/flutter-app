import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/services/firestore_repo.dart';
import '../models/country.dart';

class CountryRepository extends FirestoreRepository {
  CountryRepository({super.firestore});

  static CountryRepository shared = CountryRepository();

  Future<Country?> getCountry(String id) async {
    final doc = await getDocument('countries', id);
    print(doc.data().toString());
    if (doc.exists) {
      return Country.fromJson(doc.data()!);
    }
    return null;
  }
}
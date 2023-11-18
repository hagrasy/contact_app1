import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDService {
  User? user = FirebaseAuth.instance.currentUser;

  // add new contact to firestore

  Future addNewContact(String name, String phone, String email) async {
    try {
      Map<String, dynamic> data = {
        "name": name,
        "phone": phone,
        "email": email,
      };

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(data);

      print("Document Added");
    } catch (e) {
      print(e.toString());
    }
  }
}

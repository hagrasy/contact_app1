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

  // read the documents inside firestore

  Stream<QuerySnapshot> getContacts({String? searchQuery}) async* {
    var contactsQuery = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .orderBy("name");

// a filter to perform search
    if (searchQuery != null && searchQuery.isNotEmpty) {
      String searchEnd = searchQuery + "\uf8ff";
      contactsQuery = contactsQuery.where('name',
          isGreaterThanOrEqualTo: searchQuery, isLessThan: searchEnd);
    }
    var contacts = contactsQuery.snapshots();
    yield* contacts;
// update a contact
  }
    Future updateContact(
        String name, String phone, String email, String docID) async {
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
            .doc(docID)
            .update(data);

        print("Document Updated");
      } catch (e) {
        print(e.toString());
      }
    }

// delete contact from firestore

    Future deleteContact(String docID) async {
           

      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .collection("contacts")
            .doc(docID)
            .delete();
        print('Contact deleted');
      } catch (e) {
        print(e.toString());
      }
    }
  }


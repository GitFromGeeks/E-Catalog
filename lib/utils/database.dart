import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection("catelog");

class Database {
//Add Product

  static Future<void> addItem({
    required String image,
    required String name,
    required String category,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc("mtEnterprises").collection("catalog").doc();

    Map<String, dynamic> data = <String, dynamic>{
      'image': image,
      'name': name,
      'category': category,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Product Added  ------------"))
        .catchError((e) => print(e));
  }

// Read Product
  static Stream<QuerySnapshot> readItem() {
    CollectionReference notesItemCollection =
        _mainCollection.doc("mtEnterprises").collection("catelog");
    return notesItemCollection.snapshots();
  }
}

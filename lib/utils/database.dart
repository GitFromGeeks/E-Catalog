import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection("catalog");

class Database {
//Add Product

  static Future<void> addItem({
    required String image,
    required String name,
    required String category,
  }) async {
    DocumentReference documentReference = _mainCollection.doc();

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
    return FirebaseFirestore.instance.collection("catalog").snapshots();
  }
}

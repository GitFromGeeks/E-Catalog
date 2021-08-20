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
  static Stream<QuerySnapshot> readItem(String FilteredCategory) {
    return FirebaseFirestore.instance
        .collection("catalog")
        .where("category", isEqualTo: FilteredCategory)
        .snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection("catalog").doc(docId);
    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}

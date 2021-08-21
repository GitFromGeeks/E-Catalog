import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as path;
import '../utils/database.dart';

class Addproduct extends StatefulWidget {
  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  int value = 1;
  List<String> categories = ['Stools', 'Tables', 'Pots'];
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController categoryController = new TextEditingController();

  String? _choseCategory;

  MediaInfo? pickedImage;
  MediaInfo? imageFile;

  Uri? imageUrl;

  @override
  void initState() {
    super.initState();
    pickedImage = null;
    imageUrl = null;
  }

  pickImageFromGallery() async {
    final imageFile = await ImagePickerWeb.getImageInfo;
    if (imageFile != null) {
      setState(() {
        pickedImage = imageFile;
      });
    }
  }

  _addProductToFirebase(MediaInfo info, String name, category) async {
    final Uri imgUrl = await uploadImageToFirebase(info);
    _firestoredb(imgUrl.toString(), name, category);
    setState(() {
      imageUrl = imgUrl;
    });
  }

  _firestoredb(String img, name, category) {
    Database.addItem(image: img, name: name, category: category);
  }

  static Future<Uri> uploadImageToFirebase(MediaInfo info) async {
    String? mimeType = mime(path.basename(info.fileName ?? "null"));
    final extension = extensionFromMime(mimeType!);
    var metadata = fb.UploadMetadata(
      contentType: mimeType,
    );
    fb.StorageReference ref = fb
        .app()
        .storage()
        .refFromURL("gs://mtenterprises-b8a20.appspot.com")
        .child(
            "images/images_${DateTime.now().microsecondsSinceEpoch}.$extension");
    fb.UploadTask uploadTask = ref.put(info.data, metadata);
    fb.UploadTaskSnapshot taskSnapshot = await uploadTask.future;
    // final Uri imgurl = await taskSnapshot.ref.getDownloadURL();
    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Image(
              image: AssetImage('mt.png'),
              height: 60.0,
              width: 60.0,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  MediaQuery.of(context).size.width >= 500.0
                      ? Row(
                          children: [
                            Icon(Icons.mail, size: 15.0, color: Colors.black),
                            Padding(padding: EdgeInsets.only(left: 5.0)),
                            Text(
                              "info@mtenterprises.in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5.0)),
                          ],
                        )
                      : Text(" "),
                  Icon(Icons.phone, size: 15.0, color: Colors.black),
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Text(
                    "+91 9897704730",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Center(
          child: Card(
            child: Container(
              color: Colors.white38,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  _name(),
                  _category(),
                  Row(
                    children: [
                      _imagepicker(),
                      pickedImage != null
                          ? Icon(Icons.check_circle_outline,
                              color: Colors.greenAccent)
                          : Text("")
                    ],
                  ),
                  _addButton(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _addButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * ((MediaQuery.of(context).size.height) / 25),
          width: 5 * ((MediaQuery.of(context).size.width) / 15),
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: ElevatedButton(
            child: Text(
              "Add",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
            ),
            onPressed: () {
              _addProductToFirebase(pickedImage ?? MediaInfo(),
                  nameController.text, categoryController.text);
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }

  final snackBar = SnackBar(
      content: Text("opps. Something went wrong!",
          style: TextStyle(color: Colors.red)));

  // Widget _buildContainer() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       ClipRRect(
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(30),
  //         ),
  //         child: Container(
  //           height: MediaQuery.of(context).size.height * 0.5,
  //           width: MediaQuery.of(context).size.width * 0.8,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               _imagepicker(),
  //               _name(),
  //               _category(),
  //               _addButton(),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _name() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: nameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Color(0xff2470c7),
            ),
            labelText: "Product Name"),
      ),
    );
  }

  // Widget _category() {
  //   return Padding(
  //     padding: EdgeInsets.all(8),
  //     child: TextFormField(
  //       controller: categoryController,
  //       keyboardType: TextInputType.name,
  //       decoration: InputDecoration(
  //           prefixIcon: Icon(
  //             Icons.account_circle,
  //             color: Color(0xff2470c7),
  //           ),
  //           labelText: "Category"),
  //     ),
  //   );
  // }

  Widget _category() {
    return Container(
      child: DropdownButton(
        hint: Text(
          "Select Category :- ${categoryController.text}",
          style: TextStyle(fontSize: 30.0),
        ),
        value: _choseCategory,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: SizedBox(),
        // isExpanded: true,
        onChanged: (newValue) {
          setState(() {
            categoryController.text = newValue.toString();
          });
        },
        items: categories.map((e) {
          return DropdownMenuItem(child: Text(e), value: e);
        }).toList(),
      ),
    );
  }

  Widget _imagepicker() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: CupertinoButton(
        child: Row(
          children: [
            Text("Upload Image"),
            Icon(Icons.library_add),
          ],
        ),
        onPressed: () {
          pickImageFromGallery();
        },
      ),
    );
  }
}








// Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height * 0.6,
//             width: MediaQuery.of(context).size.width,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 // color: Color(0xff2470c7),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: const Radius.circular(70),
//                   bottomRight: const Radius.circular(70),
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Form(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only(top: 40.0)),
//                   _buildContainer(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),

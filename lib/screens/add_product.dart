import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as path;

class Addproduct extends StatefulWidget {
  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
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
      final Uri imgUrl = await uploadImageToFirebase(imageFile);
      setState(() {
        imageUrl = imgUrl;
      });
    }
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
            "images/images_${DateTime.now().microsecondsSinceEpoch}.${extension}");
    fb.UploadTask uploadTask = ref.put(info.data, metadata);
    fb.UploadTaskSnapshot taskSnapshot = await uploadTask.future;
    // final Uri imgurl = await taskSnapshot.ref.getDownloadURL();
    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uploading Product"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            pickImageFromGallery();
          },
          icon: Icon(Icons.library_add),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  FirebaseService._();

  factory FirebaseService.getInstance() => _instance;
  static final FirebaseService _instance = FirebaseService._();
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(
      {File file, String fileName, String folderName}) async {
    StorageReference storageReference =
        _firebaseStorage.ref().child('$folderName/$fileName');
    StorageUploadTask storageUploadTask = storageReference.putFile(file);
    await storageUploadTask.onComplete;
    print('File Uploaded');
    String url = await storageReference.getDownloadURL();
    return url;
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:shedistrict/models/user.dart';
import 'package:shedistrict/storage.dart';
import 'package:path/path.dart';

part 'user_store.g.dart';
class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage  _fireStorage = FirebaseStorage.instance;
  Storage storage = Storage();

  @observable
  User user = User();

  @action
  Future<void> createAccount(Map<String, dynamic> payload) async {
    final uid = payload['uid'];
    payload.remove('uid');
    await _firestore
        .collection('users')
        .doc(uid)
        .set(payload).then((res) {
    });

    await this.getUserProfile(uid);
  }

  @action
  Future<void> updateProfile(uid, payload) async{
     await _firestore
        .collection('users')
        .doc(uid)
        .update(payload);

     await getUserProfile(uid);

  }

  @action
  Future<void> getUserProfile(uid) async {
    final response = await _firestore
        .collection('users')
        .doc(uid)
        .get();

    final doc = response.data();
    print('doc $doc');
    if(doc!= null){
      User currentUser = User.fromDocument(doc);
      print('current user $currentUser');
      await storage.set('user', doc);
      user = currentUser;
    }

    await storage.set('uid', uid);
  }

  @action
  Future<String> uploadFile(File file, String ref) async {
    UploadTask uploadTask =
    _fireStorage.ref('$ref/${basename(file.path)}').putFile(file);
    await uploadTask;
    print('File Uploaded');

    String returnURL = "";
    await _fireStorage
        .ref('$ref/${basename(file.path)}')
        .getDownloadURL()
        .then((fileURL) {
      returnURL = fileURL;
    });

    return returnURL;
  }
}
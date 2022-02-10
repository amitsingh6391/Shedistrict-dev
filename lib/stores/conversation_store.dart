import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';

import '../storage.dart';

part 'conversation_store.g.dart';
class ConversationStore = ConversationStoreBase with _$ConversationStore;

abstract class ConversationStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage  _fireStorage = FirebaseStorage.instance;
  Storage storage = Storage();

  @observable
  Map conversations = {};

  @action
  Future<void> addPost(payload) async{
    await _firestore
        .collection('conversations')
        .add(payload);
  }

  @action
  Future<void> updatePost(String postId, payload) async{
    await _firestore
        .collection('conversations')
        .doc(postId)
        .update(payload);
  }

  @action
  Future<void> deletePost(String postId) async{
    await _firestore
        .collection('conversations')
        .doc(postId)
        .delete();
  }

  @action
  Future<void> likeDislikePost(String postId, payload) async{
    await _firestore
        .collection('conversations')
        .doc(postId)
        .update(payload);
  }

  Future<void> addComment(postId, payload) async{
    await _firestore
        .collection('conversations')
        .doc(postId)
        .update({'comments': payload, 'commentsCount' : payload.length});
  }

  Future<void> updateComment(String commentId, payload) async{

  }

  Future<void> deleteComment(String commentId) async{

  }
}
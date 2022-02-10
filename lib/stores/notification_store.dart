import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';

import '../storage.dart';

part 'notification_store.g.dart';
class NotificationStore = NotificationStoreBase with _$NotificationStore;

abstract class NotificationStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @action
  Future<void> addNotification(payload) async{
    await _firestore
        .collection('notifications')
        .add(payload);
  }

  @action
  Future<void> updateNotification(String notificationId, payload) async{
    await _firestore
        .collection('notifications')
        .doc(notificationId)
        .update(payload);
  }

  @action
  Future<void> markSeen(String notificationId) async{
    await _firestore
        .collection('notifications')
        .doc(notificationId)
        .update({'isSeen': true});
  }
}
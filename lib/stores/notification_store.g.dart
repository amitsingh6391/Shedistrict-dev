// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationStore on NotificationStoreBase, Store {
  final _$addNotificationAsyncAction =
      AsyncAction('NotificationStoreBase.addNotification');

  @override
  Future<void> addNotification(dynamic payload) {
    return _$addNotificationAsyncAction
        .run(() => super.addNotification(payload));
  }

  final _$updateNotificationAsyncAction =
      AsyncAction('NotificationStoreBase.updateNotification');

  @override
  Future<void> updateNotification(String notificationId, dynamic payload) {
    return _$updateNotificationAsyncAction
        .run(() => super.updateNotification(notificationId, payload));
  }

  final _$markSeenAsyncAction = AsyncAction('NotificationStoreBase.markSeen');

  @override
  Future<void> markSeen(String notificationId) {
    return _$markSeenAsyncAction.run(() => super.markSeen(notificationId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

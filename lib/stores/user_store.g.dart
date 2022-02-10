// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on UserStoreBase, Store {
  final _$userAtom = Atom(name: 'UserStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$createAccountAsyncAction = AsyncAction('UserStoreBase.createAccount');

  @override
  Future<void> createAccount(Map<String, dynamic> payload) {
    return _$createAccountAsyncAction.run(() => super.createAccount(payload));
  }

  final _$updateProfileAsyncAction = AsyncAction('UserStoreBase.updateProfile');

  @override
  Future<void> updateProfile(dynamic uid, dynamic payload) {
    return _$updateProfileAsyncAction
        .run(() => super.updateProfile(uid, payload));
  }

  final _$getUserProfileAsyncAction =
      AsyncAction('UserStoreBase.getUserProfile');

  @override
  Future<void> getUserProfile(dynamic uid) {
    return _$getUserProfileAsyncAction.run(() => super.getUserProfile(uid));
  }

  final _$uploadFileAsyncAction = AsyncAction('UserStoreBase.uploadFile');

  @override
  Future<String> uploadFile(File file, String ref) {
    return _$uploadFileAsyncAction.run(() => super.uploadFile(file, ref));
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}

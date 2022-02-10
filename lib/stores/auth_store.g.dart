// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on AuthStoreBase, Store {
  final _$tempPhoneAtom = Atom(name: 'AuthStoreBase.tempPhone');

  @override
  String get tempPhone {
    _$tempPhoneAtom.reportRead();
    return super.tempPhone;
  }

  @override
  set tempPhone(String value) {
    _$tempPhoneAtom.reportWrite(value, super.tempPhone, () {
      super.tempPhone = value;
    });
  }

  final _$loginWithEmailAsyncAction =
      AsyncAction('AuthStoreBase.loginWithEmail');

  @override
  Future<Map<dynamic, dynamic>> loginWithEmail(
      dynamic email, dynamic password) {
    return _$loginWithEmailAsyncAction
        .run(() => super.loginWithEmail(email, password));
  }

  final _$setupEmailAccountAsyncAction =
      AsyncAction('AuthStoreBase.setupEmailAccount');

  @override
  Future<Map<dynamic, dynamic>> setupEmailAccount(
      dynamic email, dynamic password) {
    return _$setupEmailAccountAsyncAction
        .run(() => super.setupEmailAccount(email, password));
  }

  final _$sendOtpAsyncAction = AsyncAction('AuthStoreBase.sendOtp');

  @override
  Future<void> sendOtp(dynamic phone, dynamic context, dynamic isLoginScreen) {
    return _$sendOtpAsyncAction
        .run(() => super.sendOtp(phone, context, isLoginScreen));
  }

  final _$verifyOtpAsyncAction = AsyncAction('AuthStoreBase.verifyOtp');

  @override
  Future<Map<dynamic, dynamic>> verifyOtp(
      dynamic verificationId, dynamic otp, dynamic isLoginScreen) {
    return _$verifyOtpAsyncAction
        .run(() => super.verifyOtp(verificationId, otp, isLoginScreen));
  }

  @override
  String toString() {
    return '''
tempPhone: ${tempPhone}
    ''';
  }
}

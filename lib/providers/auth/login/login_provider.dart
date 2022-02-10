import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/services/auth/login/login_services.dart';

final loginProvider = ChangeNotifierProvider<LoginServices>((value) {
  return LoginServices();
});

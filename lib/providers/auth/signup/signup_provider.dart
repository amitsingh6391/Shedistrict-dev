import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/services/auth/signup/signup_services.dart';

final signUpProvider = ChangeNotifierProvider<SignupServices>((value) {
  return SignupServices();
});

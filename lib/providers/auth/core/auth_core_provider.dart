import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/services/auth/core/auth_core_services.dart';

final authCoreProvider = ChangeNotifierProvider<AutCoreServices>((value) {
  return AutCoreServices();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/services/prefrences/prefrences_info.dart';

final prefrencesProvider = ChangeNotifierProvider<PrefrencesServices>((value) {
  return PrefrencesServices();
});

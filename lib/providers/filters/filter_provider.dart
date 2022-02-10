import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/services/filters/filter_service.dart';

final filterProvider = ChangeNotifierProvider<FilterService>((value) {
  return FilterService();
});

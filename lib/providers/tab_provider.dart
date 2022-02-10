import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/services/tab_info.dart';

final tabprovider = ChangeNotifierProvider<TabProvider>((value) {
  return TabProvider();
});

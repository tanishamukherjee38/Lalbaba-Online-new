import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavController extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}

final bottomNavProvider =
    NotifierProvider<BottomNavController, int>(
  BottomNavController.new,
);
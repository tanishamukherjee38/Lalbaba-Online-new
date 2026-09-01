import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lalbaba_online/features/home/presentation/widgets/appdrawer_widget.dart';

import '../controller/bottom_nav_controller.dart';
import '../widgets/bottom_nav_widget.dart';

import '../../home/presentation/pages/home_page.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({super.key});

  @override
  ConsumerState<NavigationPage> createState() {
    return _NavigationPageState();
  }
}

class _NavigationPageState
    extends ConsumerState<NavigationPage> {

  @override
  Widget build(BuildContext context) {

    final selectedIndex = ref.watch(
      bottomNavProvider,
    );

    return Scaffold(
      body: selectedIndex==0
          ? const HomePage()
          : selectedIndex==1
              ? Text('Selected Index: $selectedIndex')
              : selectedIndex==2
                  ? const HomePage()
                  : const AccountPage(
                      userName: 'John Doe',
                      userEmail: 'john.doe@example.com',
                    ),

      //const HomePage(),

      bottomNavigationBar: BottomNavWidget(
        currentIndex: selectedIndex,

        onTap: (index) {
          ref
              .read(bottomNavProvider.notifier)
              .changeIndex(index);
        },
      ),
    );
  }
}
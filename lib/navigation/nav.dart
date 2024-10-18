import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_clone/navigation/account.dart';
import 'package:uber_clone/navigation/activity.dart';
import 'package:uber_clone/navigation/home.dart';
import 'package:uber_clone/navigation/services.dart';

class NavController extends GetxController {
  // This will hold the current index of the BottomNavigationBar
  var currentIndex = 0.obs;

  // Function to change the index
  void changePage(int index) {
    currentIndex.value = index;
  }
}

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    final NavController navController = Get.put(NavController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            navController.changePage(index);
          },
          children: const [
            HomePage(),
            ServicesPage(),
            ActivityPage1(),
            AccountPage()
          ],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Consistent background
              backgroundColor:
                  Colors.black, // Set BottomNavigationBar background
              selectedItemColor: Colors.white, // Color for the selected item
              unselectedItemColor: Colors.grey, // Color for unselected items
              currentIndex:
                  navController.currentIndex.value, // Only wrap this in Obx
              onTap: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                navController.changePage(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Services'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt_outlined), label: 'Activity'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Account'),
              ],
            )),
      ),
    );
  }
}

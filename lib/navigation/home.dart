import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_clone/navigation/map_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final RadioController controller = Get.put(RadioController());

    controller.selectedValue.value = 'now';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Uber',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const CustomMapPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Where to?',
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6,
                        bottom: 6,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: Colors.black,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'When do you need a ride?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey[900],
                                      ),
                                      Obx(() => ListTile(
                                            leading: const Icon(
                                              Icons.event_note,
                                              color: Colors.white,
                                            ),
                                            title: const Text(
                                              'Now',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            subtitle: const Text(
                                              'Request a ride, hop-in, and go.',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            trailing: Radio<String>(
                                              value: 'now',
                                              groupValue: controller
                                                  .selectedValue.value,
                                              onChanged: (value) {
                                                if (value != null) {
                                                  controller
                                                          .selectedValue.value =
                                                      value; // Update selected value
                                                }
                                              },
                                              activeColor: Colors.white,
                                            ),
                                          )),
                                      Obx(() => ListTile(
                                            leading: const Icon(
                                              Icons.event,
                                              color: Colors.white,
                                            ),
                                            title: const Text(
                                              'Later',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            subtitle: const Text(
                                              'Reserve for extra peace of mind.',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            trailing: Radio<String>(
                                              value: 'later',
                                              groupValue: controller
                                                  .selectedValue.value,
                                              onChanged: (value) {
                                                if (value != null) {
                                                  controller
                                                          .selectedValue.value =
                                                      value; // Update selected value
                                                }
                                              },
                                              activeColor: Colors.white,
                                            ),
                                          )),
                                      // Radio button for 'Now'

                                      const SizedBox(height: 10),
                                      TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          // Your onPressed code here
                                        },
                                        child: const Text(
                                          'Next',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Now',
                                    style: TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white54,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Saved places
              const ListTile(
                leading: Icon(Icons.access_time, color: Colors.white),
                title: Text('Radha Nagar Bus Station',
                    style: TextStyle(color: Colors.white)),
                subtitle: Text('Radha Nagar, Agartala, Tripura',
                    style: TextStyle(color: Colors.grey)),
              ),
              const ListTile(
                leading: Icon(Icons.access_time, color: Colors.white),
                title: Text('Agartala Railway Station',
                    style: TextStyle(color: Colors.white)),
                subtitle: Text('Dukli, Agartala, Tripura',
                    style: TextStyle(color: Colors.grey)),
              ),
              // Save every day section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Commute smarter',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Go with Uber Auto ->',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Doorstep pickups, no bargaining',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Hop on Uber Moto ->',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Move through traffic & ssave time',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: Color.fromARGB(190, 32, 158, 36),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('You have multiple Promos',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1))),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Terms apply ->',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                            // SizedBox(child: Image(image: NetworkImage('url')),)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(255, 59, 55, 193),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Save time and money',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(255, 255, 255, 1))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Try Uber Moto ->',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Ride as you like it',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Book Auto ->',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Everyday commute made effortless',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Book Moto -> ',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Zip through traffic',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Save every day',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Auto rides ->',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Upfront fares, doorstep pickups',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Uber Moto rides ->',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Affordable motorcycle pickups',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioController extends GetxController {
  var selectedValue = ''.obs; // Observable variable to hold selected value
}

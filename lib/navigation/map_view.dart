import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomMapPage extends StatefulWidget {
  static const String route = '/custom-map';

  const CustomMapPage({super.key});

  @override
  CustomMapPageState createState() => CustomMapPageState();
}

class CustomMapPageState extends State<CustomMapPage> {
  MapController mapController = MapController();
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  LatLng _pinLocation = const LatLng(0, 0);
  LatLng _currentLocation = const LatLng(0, 0); // Default to some location
  bool _isMaxSize = false; // Track if the sheet is at maximum size

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    // Listener for DraggableScrollableController
    sheetController.addListener(() {
      // Check if the current sheet size is at max size
      if (sheetController.size == 1.0) {
        setState(() {
          _isMaxSize = true; // Set the flag to true if at max size
        });
      } else {
        setState(() {
          _isMaxSize = false; // Reset the flag when not at max size
        });
      }
    });
  }

  // Function to request location permission
  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied || status.isRestricted || status.isLimited) {
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); // Open app settings if permission is permanently denied
    }

    return false;
  }

  // Function to get the current location
  Future<void> _getCurrentLocation() async {
    bool hasPermission = await _requestLocationPermission();
    LocationAccuracy desiredAccuracy = LocationAccuracy.best;

    if (hasPermission) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _pinLocation =
            _currentLocation; // Initially set pin location to current location
        mapController.move(
            _currentLocation, 15); // Move map to current location
      });
    } else {
      print("Location permission not granted.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: _currentLocation, // Use the current location
                initialZoom: 15.0, // Default zoom level
                onPositionChanged: (mapposition, hasGesture) {
                  if (hasGesture) {
                    setState(() {
                      _pinLocation = mapposition.center;
                    });
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.uber_clone',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentLocation, // Position of the blue marker
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.circle,
                        size: 20,
                        color: Colors.blue, // Color of the blue marker
                      ),
                    ),
                    Marker(
                      point: _pinLocation, // Position of the red marker
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.red, // Color of the red marker
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _getCurrentLocation,
                child: const Icon(Icons.my_location),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: BackButton(
                color: Colors.white,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => Get.back(),
              ),
            ),
            DraggableScrollableSheet(
              controller: sheetController,
              snapAnimationDuration: const Duration(milliseconds: 50),
              snap: true,
              initialChildSize: 0.3, // Start at 30% height
              minChildSize: 0.3, // Cannot be dragged down lower than 30%
              maxChildSize: 1, // Can expand to full height
              builder: (context, scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 4,
                            width: 40,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Set your destination',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const Text(
                                      'Drag map to move pin',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 16),
                                    InkWell(
                                      onTap: () {
                                        sheetController.animateTo(
                                          1,
                                          duration:
                                              const Duration(milliseconds: 150),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[900],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
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
                                    const SizedBox(height: 15),
                                    SizedBox(
                                      width: double.infinity,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors.white),
                                        ),
                                        onPressed: () {
                                          Get.snackbar(
                                            'Location Saved',
                                            'Lat: ${_pinLocation.latitude}, Lng: ${_pinLocation.longitude}',
                                          );
                                        },
                                        child: const Text(
                                          'Next',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                  ],
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: AnimatedOpacity(
                                    opacity: _isMaxSize ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: _isMaxSize
                                        ? BackButton(
                                            color: Colors.white,
                                            onPressed: () {
                                              sheetController.animateTo(
                                                0.3,
                                                duration: const Duration(
                                                    milliseconds: 150),
                                                curve: Curves.bounceIn,
                                              );
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

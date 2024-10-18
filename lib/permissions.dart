import 'package:permission_handler/permission_handler.dart';

Future<bool> requestLocationPermission() async {
  var status = await Permission.location.status;

  if (status.isDenied || status.isRestricted || status.isLimited) {
    status = await Permission.location.request();
  }

  // Handle permission based on the user's choice
  if (status.isGranted) {
    print("Location permission granted.");
    return true;
  } else if (status.isDenied) {
    print("Location permission denied.");
  } else if (status.isPermanentlyDenied) {
    print(
        "Location permission is permanently denied. You can open settings to enable it.");
    // Optionally open the app settings if the permission is permanently denied
    openAppSettings();
  }

  return false;
}

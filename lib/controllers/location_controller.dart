import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:movieticketbookingapp/controllers/shared_pref.dart';
import 'package:movieticketbookingapp/utils/dummy_data.dart';

class LocationController extends GetxController {
  late RxString city;
  RxBool isLocating = false.obs;
  static LocationController instance = Get.find();

  @override
  void onInit() async {
    city = (await SharedPref.getLocation()).obs;
    super.onInit();
  }

  Future<void> getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    setIsLocating(false);
    //check if the location service enabled or not
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    //check the location permission is granted or not
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setIsLocating(true);
    //getting the current location
    _locationData = await location.getLocation();

    var address = await geo.GeocodingPlatform.instance.placemarkFromCoordinates(
      _locationData.latitude!,
      _locationData.longitude!,
    );
    isLocating(false);
    setCity(address[0].locality!);
  }

  setCity(String myCity) async {
    city = myCity.obs;
    await SharedPref.storeLocation(myCity);
    update();
  }

  setIsLocating(bool val) {
    isLocating = val.obs;
    update();
  }
}

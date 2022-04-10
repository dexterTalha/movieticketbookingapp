import 'package:movieticketbookingapp/controllers/location_controller.dart';
import 'package:movieticketbookingapp/utils/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;
  static storeLocation(String city) async {
    pref = await SharedPreferences.getInstance();
    pref.setString("location", city);
  }

  static Future<String> getLocation() async {
    pref = await SharedPreferences.getInstance();
    String city = pref.getString("location")!;
    LocationController.instance.setCity(city);
    return city;
  }
}

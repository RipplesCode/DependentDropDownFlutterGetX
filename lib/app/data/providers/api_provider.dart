import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/model/state_model.dart';
import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/model/zone_model.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  String appBaseUrl =
      "http://192.168.14.235/ZoneStateApi/public/index.php/api/";

  // Get Zone

  Future<ZoneModel> getZone() async {
    try {
      final response = await get(appBaseUrl + "getZone");
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return zoneModelFromJson(response.bodyString!);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

// get State
  Future<StateModel> getState(String zoneId) async {
    try {
      final response = await get(appBaseUrl + "getState/"+ zoneId);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return stateModelFromJson(response.bodyString!);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/model/state_model.dart';
import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/model/zone_model.dart';
import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/providers/api_provider.dart';

class Repository {
  final ApiProvider apiProvider;

  Repository(this.apiProvider);

  // Getzone
  Future<ZoneModel> getZone() =>
      apiProvider.getZone();

  // Get state
  Future<StateModel> getState(var zoneId) => apiProvider.getState(zoneId);

  
}

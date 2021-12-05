import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<HomeController>(
        () => HomeController(Repository(ApiProvider())));
  }
}

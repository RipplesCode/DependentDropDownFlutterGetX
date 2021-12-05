import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/model/zone_model.dart';
import 'package:database_driven_dependent_dropdown_flutter_getx/app/data/model/state_model.dart';
import 'package:database_driven_dependent_dropdown_flutter_getx/app/modules/home/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Repository repository;
  HomeController(this.repository);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<List<Zone>> lstZoneModel = Rx<List<Zone>>([]);
  var selectedZoneId = "0".obs;
  Rx<List<DropdownMenuItem<String>>> lstZoneDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);

  Rx<List<States>> lstStateModel = Rx<List<States>>([]);
  var selectedStateId = "0".obs;
  Rx<List<DropdownMenuItem<String>>> lstStateDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getZone();
  }

  @override
  void onClose() {}

  void getZone() {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository.getZone().then((value) {
        if (value.zoneData!.length > 0) {
          Get.back();
          lstZoneModel.value.clear();
          lstZoneModel.value.addAll(value.zoneData!);
          lstZoneDropDownMenuItem.value = [];
          lstZoneDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Zone',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (Zone zone in lstZoneModel.value) {
            lstZoneDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  zone.zoneName.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: zone.zoneId.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }

  void getState(String zoneId) {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository.getState(zoneId).then((value) {
        if (value.stateData!.length > 0) {
          Get.back();
          lstStateModel.value.clear();
          lstStateModel.value.addAll(value.stateData!);
          lstStateDropDownMenuItem.value = [];
          lstStateDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select State',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (States states in lstStateModel.value) {
            lstZoneDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  states.stateName.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: states.stateId.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }

  String? validateZone(String value) {
    if (value == "0") {
      return "Select Zone";
    }
    return null;
  }

  String? validateState(String value) {
    if (value == "0") {
      return "Select State";
    }
    return null;
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Driven Dependent Dropdown'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => DropdownButtonFormField(
                    isDense: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return controller.validateZone(val.toString());
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    items: controller.lstZoneDropDownMenuItem.value,
                    value: controller.selectedZoneId.value,
                    hint: Text(
                      "Select Zone",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (selectedValue) {
                      controller.selectedZoneId.value =
                          selectedValue.toString();
                      if (controller.selectedZoneId.value != "0") {
                        controller.getState(controller.selectedZoneId.value);
                      }
                    },
                    isExpanded: true,
                  ),
                ),
                SizedBox(height: 10,),
                 Obx(
                  () => DropdownButtonFormField(
                    isDense: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return controller.validateState(val.toString());
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    items: controller.lstStateDropDownMenuItem.value,
                    value: controller.selectedStateId.value,
                    hint: Text(
                      "Select State",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (selectedValue) {
                      controller.selectedStateId.value =
                          selectedValue.toString();
                     
                    },
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

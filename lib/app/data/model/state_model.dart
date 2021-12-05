// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  StateModel({
    this.stateData,
  });

  List<States>? stateData;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        stateData: List<States>.from(
            json["stateData"].map((x) => States.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stateData": List<dynamic>.from(stateData!.map((x) => x.toJson())),
      };
}

class States {
  States({
    this.stateId,
    this.stateName,
  });

  int? stateId;
  String? stateName;

  factory States.fromJson(Map<String, dynamic> json) => States(
        stateId: json["stateId"],
        stateName: json["stateName"],
      );

  Map<String, dynamic> toJson() => {
        "stateId": stateId,
        "stateName": stateName,
      };
}

class DistricResult {
  DistricResult({
    this.currVal,
    this.message,
    this.results,
  });

  String? currVal;
  String? message;
  List<DistricModel>? results;

  factory DistricResult.fromJson(Map<String, dynamic> json) => DistricResult(
        currVal: json["curr_val"],
        message: json["message"],
        results: List<DistricModel>.from(
            json["results"].map((x) => DistricModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "curr_val": currVal,
        "message": message,
        "results": List<dynamic>.from(results ?? [].map((x) => x.toJson())),
      };
}

class DistricModel {
  DistricModel({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory DistricModel.fromJson(Map<String, dynamic> json) => DistricModel(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };

  String userAsString() {
    return '#$key $value';
  }

  bool isEqual(DistricModel model) {
    return key == model.key;
  }

  @override
  String toString() => key ?? "";
}

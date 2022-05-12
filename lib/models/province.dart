class ProvinceResults {
  ProvinceResults({
    this.currVal,
    this.message,
    this.results,
  });

  String? currVal;
  String? message;
  List<ProvinceModel>? results;

  factory ProvinceResults.fromJson(Map<String, dynamic> json) =>
      ProvinceResults(
        currVal: json["curr_val"],
        message: json["message"],
        results: List<ProvinceModel>.from(
            json["results"].map((x) => ProvinceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "curr_val": currVal,
        "message": message,
        "results": List<dynamic>.from(results ?? [].map((x) => x.toJson())),
      };
}

class ProvinceModel {
  ProvinceModel({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
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

  bool isEqual(ProvinceModel model) {
    return key == model.key;
  }

  @override
  String toString() => key ?? "";
}

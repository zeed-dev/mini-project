class CovidModel {
  CovidModel({
    this.positif,
    this.dirawat,
    this.sembuh,
    this.meninggal,
    this.lastUpdate,
  });

  int? positif;
  int? dirawat;
  int? sembuh;
  int? meninggal;
  DateTime? lastUpdate;

  factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
        positif: json["positif"],
        dirawat: json["dirawat"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "positif": positif,
        "dirawat": dirawat,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "lastUpdate": lastUpdate.toString(),
      };
}

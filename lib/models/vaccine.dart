class VaccineResults {
  VaccineResults({
    this.success,
    this.message,
    this.countTotal,
    this.data,
  });

  bool? success;
  String? message;
  int? countTotal;
  List<VaccineModel>? data;

  factory VaccineResults.fromJson(Map<String, dynamic> json) => VaccineResults(
        success: json["success"],
        message: json["message"],
        countTotal: json["count_total"],
        data: List<VaccineModel>.from(
            json["data"].map((x) => VaccineModel.fromJson(x))),
      );
}

class VaccineModel {
  VaccineModel({
    this.id,
    this.kode,
    this.nama,
    this.kota,
    this.provinsi,
    this.alamat,
    this.latitude,
    this.longitude,
    this.telp,
    this.jenisFaskes,
    this.kelasRs,
    this.status,
    this.detail,
    this.sourceData,
  });

  int? id;
  String? kode;
  String? nama;
  String? kota;
  String? provinsi;
  String? alamat;
  String? latitude;
  String? longitude;
  String? telp;
  String? jenisFaskes;
  String? kelasRs;
  String? status;
  List<VaccineDetail>? detail;
  String? sourceData;

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        kota: json["kota"],
        provinsi: json["provinsi"],
        alamat: json["alamat"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        telp: json["telp"],
        jenisFaskes: json["jenis_faskes"],
        kelasRs: json["kelas_rs"],
        status: json["status"],
        detail: List<VaccineDetail>.from(
            json["detail"].map((x) => VaccineDetail.fromJson(x))),
        sourceData: json["source_data"],
      );
}

class VaccineDetail {
  VaccineDetail({
    this.id,
    this.kode,
    this.batch,
    this.divaksin,
    this.divaksin1,
    this.divaksin2,
    this.batalVaksin,
    this.batalVaksin1,
    this.batalVaksin2,
    this.pendingVaksin,
    this.pendingVaksin1,
    this.pendingVaksin2,
    this.tanggal,
  });

  int? id;
  String? kode;
  String? batch;
  int? divaksin;
  int? divaksin1;
  int? divaksin2;
  int? batalVaksin;
  int? batalVaksin1;
  int? batalVaksin2;
  int? pendingVaksin;
  int? pendingVaksin1;
  int? pendingVaksin2;
  String? tanggal;

  factory VaccineDetail.fromJson(Map<String, dynamic> json) => VaccineDetail(
        id: json["id"],
        kode: json["kode"],
        batch: json["batch"],
        divaksin: json["divaksin"],
        divaksin1: json["divaksin_1"],
        divaksin2: json["divaksin_2"],
        batalVaksin: json["batal_vaksin"],
        batalVaksin1: json["batal_vaksin_1"],
        batalVaksin2: json["batal_vaksin_2"],
        pendingVaksin: json["pending_vaksin"],
        pendingVaksin1: json["pending_vaksin_1"],
        pendingVaksin2: json["pending_vaksin_2"],
        tanggal: json["tanggal"],
      );
}

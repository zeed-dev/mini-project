class UserModel {
  final String? id;
  final String? email;
  final String? name;
  final String? address;
  final String? phone;

  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      address: map['address'],
      phone: map['phone'],
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? address,
    String? phone,
    String? status,
    String? vaksinKe,
    String? dateVisit,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }
}

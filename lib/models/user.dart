class UserModel {
  final String? id;
  final String? email;
  final String? name;
  final String? address;
  final String? phone;
  final bool isAdmin;

  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.address,
    required this.phone,
    this.isAdmin = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
      'phone': phone,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      address: map['address'],
      phone: map['phone'],
      isAdmin: map['isAdmin'],
    );
  }
}

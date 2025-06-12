class UserModel {
  final String name;
  final String email;
  final String phone;
  final String website;
  final String companyName;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.website,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      companyName: jsonData['company']['name'],
      website: jsonData['website'],
    );
  }
}

// implement user model to cache and update user details

class UserModel {
  final int? userId;
  final String? email;
  final String? username;
  final String? name;
  final int? totalProducts;
  final String? profile;

  UserModel({
    this.userId,
    this.email,
    this.username,
    this.name,
    this.totalProducts,
    this.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      email: json['email'],
      username: json['username'],
      name: json['name'],
      totalProducts: json['totalProducts'],
      profile: json['profile'],
    );
  }
}

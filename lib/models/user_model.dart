// implement user model to cache and update user details

class UserModel {
  final int userId;
  final String email;
  final String username;
  final String name;
  final int totalProducts;
  final String profile;

  UserModel({
    required this.userId,
    required this.email,
    required this.username,
    required this.name,
    required this.totalProducts,
    required this.profile,
  });

}

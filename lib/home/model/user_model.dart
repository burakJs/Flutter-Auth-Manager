class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake() {
    return UserModel(name: 'Burak', imageUrl: 'https://avatars.githubusercontent.com/u/70351342?v=4');
  }
}

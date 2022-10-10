class Users {
  int idUser = 0;
  String token = "";
  String email = "";

  Users._privateConstructor();

  static final Users _instance = Users._privateConstructor();

  static Users get instance => _instance;
}

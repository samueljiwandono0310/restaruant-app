class UserModel {
  String id;
  String username;
  String nickName;
  String dateOfBird;
  String gender;
  String address;
  String nationality;
  String password;

  UserModel({
    this.id,
    this.username,
    this.nickName,
    this.dateOfBird,
    this.gender,
    this.address,
    this.nationality,
    this.password,
  });

  String get userId => id;
  String get userName => username;
  String get userNickName => nickName;
  String get userDateOfBird => dateOfBird;
  String get userGender => gender;
  String get userAddress => address;
  String get userNationality => nationality;
  String get userPassword => password;

  factory UserModel.fromJson(Map<String, dynamic> data) => new UserModel(
        id: data["id"],
        username: data["username"],
        nickName: data["nickName"],
        dateOfBird: data["dateOfBird"],
        gender: data["gender"],
        address: data["address"],
        nationality: data["nationality"],
        password: data["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": username,
        "nickName": nickName,
        "dateOfBird": dateOfBird,
        "gender": gender,
        "address": address,
        "nationality": nationality,
        "password": password,
      };
}

class UserModel {
  UserModel({
        this.id,
        this.userName,
        this.nickName,
        this.dateOfBird,
        this.gender,
        this.address,
        this.nationality,
        this.password,
    });

    int id;
    String userName;
    String nickName;
    String dateOfBird;
    String gender;
    String address;
    String nationality;
    String password;

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userName: json["userName"],
        nickName: json["nickName"],
        dateOfBird: json["dateOfBird"],
        gender: json["gender"],
        address: json["address"],
        nationality: json["nationality"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userName": userName,
        "nickName": nickName,
        "dateOfBird": dateOfBird,
        "gender": gender,
        "address": address,
        "nationality": nationality,
        "password": password,
    };
}

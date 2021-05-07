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

    String id;
    String userName;
    String nickName;
    String dateOfBird;
    String gender;
    String address;
    String nationality;
    String password;

    factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map["id"],
        userName: map["userName"],
        nickName: map["nickName"],
        dateOfBird: map["dateOfBird"],
        gender: map["gender"],
        address: map["address"],
        nationality: map["nationality"],
        password: map["password"],
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

class ReservationModel {
  ReservationModel({
    this.reservationId,
    this.userId,
    this.restauranId,
    this.seatNumber,
    this.reservationDate,
  });

  String reservationId;
  String userId;
  int restauranId;
  int seatNumber;
  String reservationDate;

  factory ReservationModel.fromMap(Map<String, dynamic> map) =>
      ReservationModel(
        reservationId: map["reservationId"],
        userId: map["userId"],
        restauranId: map["restauranId"],
        seatNumber: map["seatNumber"],
        reservationDate: map["reservationDate"],
      );

  Map<String, dynamic> toMap() => {
        "reservationId": reservationId,
        "userId": userId,
        "restauranId": restauranId,
        "seatNumber": seatNumber,
        "reservationDate": reservationDate,
      };
}

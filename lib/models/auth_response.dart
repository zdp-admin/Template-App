class AuthResponse {
  String error;
  String cardNumber;
  String name;
  String lastName;
  String emai;
  String expirationDate;
  String registrationDate;
  String status;
  String uuid;
  String noticeOfPrivacy;
  String frontImage;
  String backImage;

  AuthResponse(
      {this.error,
      this.cardNumber,
      this.name,
      this.lastName,
      this.emai,
      this.expirationDate,
      this.registrationDate,
      this.status,
      this.uuid,
      this.noticeOfPrivacy,
      this.frontImage,
      this.backImage});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
        error: json['error'] ?? '',
        cardNumber: json['Numero_Tarjeta'] ?? '',
        name: json['Nombre'] ?? '',
        lastName: json['Apellidos'] ?? '',
        emai: json['Email'] ?? '',
        expirationDate: json['Fecha_Vigencia'] ?? '',
        registrationDate: json['Fecha_Alta'] ?? '',
        status: json['Estatus'] ?? '',
        uuid: json['UUID'] ?? '',
        noticeOfPrivacy: json['Aviso_Privacidad'] ?? '',
        frontImage: json['Imagen_Frontal'] ?? '',
        backImage: json['Imagen_Trasera'] ?? '');
  }
}

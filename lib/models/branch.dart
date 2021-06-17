class Branch {
  int id;
  int idBranchOffice;
  int idCountry;
  String country;
  int idState;
  String state;
  int idMunicipality;
  String municipality;
  String name;
  String address;
  String numberInt;
  String numberExt;
  String colony;
  String zipCode;
  String email;
  String telephone;
  double latitud;
  double longitud;
  String activo;

  Branch({
    this.id,
    this.idBranchOffice,
    this.idCountry,
    this.country,
    this.idState,
    this.state,
    this.idMunicipality,
    this.municipality,
    this.name,
    this.address,
    this.numberInt,
    this.numberExt,
    this.colony,
    this.zipCode,
    this.email,
    this.telephone,
    this.latitud,
    this.longitud,
    this.activo
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: int.tryParse((json['id'] ?? 0).toString()),
      idBranchOffice: int.tryParse((json['establecimiento_id'] ?? 0).toString()),
      idCountry: int.tryParse((json['pais_id'] ?? 0).toString()),
      country: json['pais'] ?? '',
      idState: int.tryParse((json['estado_id'] ?? 0).toString()),
      state: json['estado'] ?? '',
      idMunicipality: int.tryParse((json['municipio_id'] ?? 0).toString()),
      municipality: json['municipio'] ?? '',
      name: json['sucursal'] ?? '',
      address: json['calle'] ?? '',
      numberInt: json['numero_exterior'] ?? '',
      numberExt: json['numero_interior'] ?? '',
      colony: json['colonia'] ?? '',
      zipCode: json['cp'] ?? '',
      email: json['email'] ?? '',
      telephone: json['telefonos'] ?? '',
      latitud: double.tryParse((json['latitud'] ?? 0).toString()),
      longitud: double.tryParse((json['longitud'] ?? 0).toString()),
      activo: json['activo'] ?? 'S'
    );
  }
}
class Promotion {
  int id;
  int idBranchOffice;
  String branchOffice;
  String title;
  int idEstablishment;
  String description;
  String logo;
  String image;

  String content;
  String restriction;
  String urlCupon;
  String imgPromotion;
  String active;

  Promotion({
    this.id,
    this.idBranchOffice,
    this.branchOffice,
    this.title,
    this.idEstablishment,
    this.description,
    this.logo,
    this.image,
    this.content,
    this.restriction,
    this.urlCupon,
    this.imgPromotion,
    this.active
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id_promocion'] ?? 0,
      idBranchOffice: json['id_sucursal'] ?? 0,
      branchOffice: json['establecimiento'] ?? '',
      title: json['promocion'] ?? '',
      idEstablishment: json['id_establecimiento'] ?? 0,
      description: json['descripcion'] ?? '',
      logo: json['logo'] ?? '',
      image: json['imagen'] ?? '',
      content: json['contenido'] ?? '',
      restriction: json['restricciones'] ?? '',
      urlCupon: json['url_cupon'] ?? '',
      imgPromotion: json['img_promocion'] ?? '',
      active: json['activo'] ?? 'S'
    );
  }
}
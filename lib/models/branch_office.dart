import '../models/branch.dart';
import '../models/promotion.dart';

class BranchOffice {
  int id;
  String name;
  String introduction;
  String content;
  String logo;
  String email;
  String url;
  String facebook;
  String twitter;
  String googlePlus;
  String linkedin;
  String youtube;
  String pinterest;
  String foursquare;
  String instagram;
  String activo;
  Promotion promotion;
  Branch brach;
  List<Branch> brachs;

  BranchOffice(
      {this.id,
      this.name,
      this.introduction,
      this.content,
      this.logo,
      this.email,
      this.url,
      this.facebook,
      this.twitter,
      this.googlePlus,
      this.linkedin,
      this.youtube,
      this.pinterest,
      this.foursquare,
      this.instagram,
      this.activo,
      this.promotion,
      this.brach,
      this.brachs});

  factory BranchOffice.fromJson(Map<String, dynamic> json) {
    Iterable branchs = (json['sucursales'] ?? []) as Iterable;

    return BranchOffice(
        id: json['id'] ?? 0,
        name: json['establecimiento'] ?? '',
        introduction: json['introduccion'] ?? '',
        content: json['contenido'] ?? '',
        logo: json['img_logotipo'] ?? '',
        email: json['email'] ?? '',
        url: json['url'] ?? '',
        facebook: json['facebook'] ?? '',
        twitter: json['twitter'] ?? '',
        googlePlus: json['googleplus'] ?? '',
        linkedin: json['linkedin'] ?? '',
        youtube: json['youtube'] ?? '',
        pinterest: json['pinterest'] ?? '',
        foursquare: json['foursquare'] ?? '',
        instagram: json['instagram'] ?? '',
        activo: json['activo'] ?? '',
        promotion: Promotion.fromJson(json['promocion'] ?? {}),
        brach: Branch.fromJson(json['sucursal'] ?? {}),
        brachs: branchs.map((bran) => Branch.fromJson(bran)).toList());
  }
}

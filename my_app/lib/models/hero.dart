import '../enum/hero_type.dart';

class HeroDTO {
  String name;
  String imgUrl;
  // HeroType? type;
  // String? description;

  HeroDTO(this.name, this.imgUrl);

  factory HeroDTO.fromJson(dynamic json) {
    return HeroDTO(
      json['name'] as String,
      json['imgUrl'] as String,
    );
  }
}

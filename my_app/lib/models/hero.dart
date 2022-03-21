import '../enum/hero_type.dart';

class Hero {
  String name;
  String imgUrl;
  HeroType type;
  String? description;

  Hero(this.name, this.imgUrl, this.type, this.description);
}

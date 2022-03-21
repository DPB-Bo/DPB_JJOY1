class ItemDTO {
  String name;
  String imgUrl;
  // HeroType? type;
  // String? description;

  ItemDTO(this.name, this.imgUrl);

  factory ItemDTO.fromJson(dynamic json) {
    return ItemDTO(
      json['name'] as String,
      json['imgUrl'] as String,
    );
  }
}

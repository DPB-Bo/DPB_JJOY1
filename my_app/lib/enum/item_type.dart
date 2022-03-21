enum ItemType { attack, magic, defense, movement, jungling, support }

extension ItemTypeExtension on ItemType {
  String get label {
    switch (this) {
      case ItemType.attack:
        return "Attack";
      case ItemType.magic:
        return "Magic";
      case ItemType.defense:
        return "Defense";
      case ItemType.movement:
        return "Movement";
      case ItemType.jungling:
        return "Jungling";
      case ItemType.support:
        return "Support";
    }
  }
}

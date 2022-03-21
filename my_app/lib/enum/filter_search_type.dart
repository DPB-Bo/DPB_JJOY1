enum FilterSearchType { item, hero, rune }

extension FilterSearchTypeExtension on FilterSearchType {
  String get label {
    switch (this) {
      case FilterSearchType.item:
        return "Item";
      case FilterSearchType.hero:
        return "Hero";
      case FilterSearchType.rune:
        return "Rune";
    }
  }
}

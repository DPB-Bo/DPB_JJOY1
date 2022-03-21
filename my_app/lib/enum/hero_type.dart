enum HeroType { adc, assassin, warrior, mage, tank, support }

extension HeroTypeExtension on HeroType {
  String get label {
    switch (this) {
      case HeroType.adc:
        return "Marksman";
      case HeroType.assassin:
        return "Assassin";
      case HeroType.warrior:
        return "Warrior";
      case HeroType.mage:
        return "Mage";
      case HeroType.tank:
        return "Tank";
      case HeroType.support:
        return "Support";
    }
  }
}

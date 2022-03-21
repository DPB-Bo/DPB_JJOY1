enum RuneType { red, purple, green }

extension ItemTypeExtension on RuneType {
  String get label {
    switch (this) {
      case RuneType.red:
        return "Red";
      case RuneType.purple:
        return "Purple";
      case RuneType.green:
        return "Green";
    }
  }
}

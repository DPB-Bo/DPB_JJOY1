import 'package:faker/faker.dart';

class FakeDataUtility {
  List<String> getImageUrl() {
    var fakerData = new Faker();
    List<String> list = [
      fakerData.image
          .image(width: 400, height: 180, keywords: ['space'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['space'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['space'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['space'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['space'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['space'], random: true),
    ];
    list.forEach((element) {
      print("[LOGS]" + element);
    });
    return list;
  }
}

import 'package:faker/faker.dart';
import 'package:my_app/enum/filter_search_type.dart';
import 'package:my_app/enum/item_type.dart';
import 'package:my_app/enum/rune_type.dart';

import '../enum/hero_type.dart';
import '../models/filter_search_crtl.dart';
import '../models/filter_search_data.dart';
import '../models/news.dart';

class FakeDataUtility {
  var fakerData = new Faker();
  List<String> getHightLights() {
    List<String> list = [
      fakerData.image
          .image(width: 400, height: 180, keywords: ['news'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['news'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['news'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['news'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['news'], random: true),
      fakerData.image
          .image(width: 400, height: 180, keywords: ['news'], random: true),
    ];
    list.forEach((element) {
      print("[LOGS]" + element);
    });
    return list;
  }

  String getImageUrl() {
    print("=======================");
    return Faker()
        .image
        .image(width: 400, height: 180, keywords: ['car'], random: true);
  }

  List<News> getNews() {
    print("=======================" + getImageUrl());
    return [
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
      News(Faker().lorem.word(), Faker().lorem.sentence(), getImageUrl(),
          Faker().date.time(), Faker().person.name()),
    ];
  }

  FilterSearchControl getFilterSearchControlForHeroPage() {
    List<FilterSearchData> listfilter = [
      FilterSearchData(HeroType.adc.label, false),
      FilterSearchData(HeroType.assassin.label, false),
      FilterSearchData(HeroType.tank.label, false),
      FilterSearchData(HeroType.warrior.label, false),
      FilterSearchData(HeroType.mage.label, false),
      FilterSearchData(HeroType.support.label, false),
    ];
    return FilterSearchControl(FilterSearchType.hero, listfilter);
  }

  FilterSearchControl getFilterSearchControlForItemPage() {
    List<FilterSearchData> listfilter = [
      FilterSearchData(ItemType.attack.label, false),
      FilterSearchData(ItemType.defense.label, false),
      FilterSearchData(ItemType.magic.label, false),
      FilterSearchData(ItemType.movement.label, false),
      FilterSearchData(ItemType.jungling.label, false),
      FilterSearchData(ItemType.support.label, false),
    ];
    return FilterSearchControl(FilterSearchType.item, listfilter);
  }

  FilterSearchControl getFilterSearchControlForRunePage() {
    List<FilterSearchData> listfilter = [
      FilterSearchData(RuneType.red.label, false),
      FilterSearchData(RuneType.green.label, false),
      FilterSearchData(RuneType.purple.label, false),
    ];
    return FilterSearchControl(FilterSearchType.rune, listfilter);
  }
}

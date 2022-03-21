import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/item_search_comps.dart';

import '../components/filter_search_comps.dart';
import '../models/filter_search_crtl.dart';
import '../util/fake_data.dart';

class HeroWikiPage extends StatefulWidget {
  const HeroWikiPage({Key? key}) : super(key: key);

  @override
  State<HeroWikiPage> createState() => _HeroWikiPageState();
}

class _HeroWikiPageState extends State<HeroWikiPage> {
  FakeDataUtility fakeDataService = FakeDataUtility();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFE9E9E9),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
                title: Text(
                  'JJ-WIKI',
                ),
                backgroundColor: Colors.black),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilerSearchComponent(
                        filterControl: fakeDataService
                            .getFilterSearchControlForHeroPage()),
                  ],
                ),
              )
            ])),
            ItemSearchComponent(listData: fakeDataService.getAllHero())
          ],
        ));
  }
}

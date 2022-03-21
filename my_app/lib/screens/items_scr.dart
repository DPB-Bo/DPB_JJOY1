import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/filter_search_comps.dart';
import '../util/fake_data.dart';

class ItemsPage extends StatefulWidget {
  @override
  State<ItemsPage> createState() => _ItemsPage();
}

class _ItemsPage extends State<ItemsPage> {
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
                  children: [
                    FilerSearchComponent(
                      filterControl:
                          fakeDataService.getFilterSearchControlForItemPage(),
                    )
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}

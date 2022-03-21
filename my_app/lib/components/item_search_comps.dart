import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/util/fake_data.dart';

import '../models/hero.dart';

class ItemSearchComponent extends StatefulWidget {
  const ItemSearchComponent({Key? key}) : super(key: key);

  @override
  State<ItemSearchComponent> createState() => _ItemSearchComponentState();
}

class _ItemSearchComponentState extends State<ItemSearchComponent> {
  Future<List<HeroDTO>> listHero = FakeDataUtility().getAllHero();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HeroDTO>>(
        future: listHero,
        builder: (context, snapshot) {
          final datas = snapshot.data ?? [];

          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {},
                  child: Item(
                    data: datas[i],
                  ),
                );
              },
              childCount: datas?.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 0.9, mainAxisSpacing: 4),
          );
        });
  }
}

class Item extends StatelessWidget {
  final HeroDTO data;
  const Item({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromARGB(255, 188, 211, 250),
      onTap: () {
        print('tappp');
        FakeDataUtility().getAllHero();
      },
      child: Container(
        margin: EdgeInsets.only(left: 3, right: 3),
        width: MediaQuery.of(context).size.width * 0.24,
        height: 40,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Color.fromARGB(255, 236, 202, 7),
                width: 2,
              )),
              child: Image.network(data.imgUrl),
            ),
            Text(data.name,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: Colors.black87,
                      letterSpacing: .5,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}

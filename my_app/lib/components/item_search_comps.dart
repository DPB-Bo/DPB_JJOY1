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
              childCount: datas.length,
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
    return Center(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Card(
          elevation: 12,
          shadowColor: Colors.yellow.shade700,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: Colors.yellow.shade700,
            onTap: (() {}),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: Colors.yellow.shade700)),
                  child: Ink.image(
                    alignment: Alignment.topCenter,
                    height: 70,
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Center(
                  child: Text(data.name,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Ink.image(
//               fit: BoxFit.cover,
//               image: AssetImage("./assets/images/short_sword.png"),
//               child: InkWell(
//                 onTap: (() {}),
//               ),
//             ),
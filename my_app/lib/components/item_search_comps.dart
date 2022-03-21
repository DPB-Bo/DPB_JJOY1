import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSearchComponent extends StatefulWidget {
  const ItemSearchComponent({Key? key}) : super(key: key);

  @override
  State<ItemSearchComponent> createState() => _ItemSearchComponentState();
}

class _ItemSearchComponentState extends State<ItemSearchComponent> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {},
            child: Item(),
          );
        },
        childCount: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 0.9, mainAxisSpacing: 4),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: InkWell(
                onTap: () {},
                splashColor: Colors.yellow,
                child: Ink.image(
                  fit: BoxFit.cover,
                  image: AssetImage("./assets/images/short_sword.png"),
                ),
              )),
          Text("Short Sword",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: Colors.black87,
                    letterSpacing: .5,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroWikiPage extends StatefulWidget {

  @override
  State<HeroWikiPage> createState() => _HeroWikiPageState();
}

class _HeroWikiPageState extends State<HeroWikiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('1'),
      // ),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.black,)
              ),
            )
          ],
        ),
      ),
    );
  }
}

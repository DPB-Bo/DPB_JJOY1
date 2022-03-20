import 'package:flutter/material.dart';

class RunesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RunesPage();
}

class _RunesPage extends State<RunesPage> {
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
                  children: [Column()],
                ),
              )
            ]))
          ],
        ));
  }
}

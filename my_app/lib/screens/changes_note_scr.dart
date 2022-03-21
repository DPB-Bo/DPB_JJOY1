import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangesNotePage extends StatefulWidget {
  @override
  State<ChangesNotePage> createState() => _ChangesNotePage();
}

class _ChangesNotePage extends State<ChangesNotePage> {
  var _selected = false;
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
                    FilterChip(
                        label: Text("Codesinsider"),
                        selected: _selected,
                        onSelected: (value) {
                          setState(() {
                            _selected = value;
                          });
                        })
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/herotype.dart';
import 'package:my_app/util/fake_data.dart';

class HeroWikiPage extends StatefulWidget {
  @override
  State<HeroWikiPage> createState() => _HeroWikiPageState();
}

class _HeroWikiPageState extends State<HeroWikiPage> {
  @override
  List<HeroTypeFilter> listfilter = [
    HeroTypeFilter('XẠ THỦ', false),
    HeroTypeFilter('ĐẤU SĨ', false),
    HeroTypeFilter('SÁT THỦ', false),
    HeroTypeFilter('PHÁP SƯ', false),
    HeroTypeFilter('TRỢ THỦ', false),
    HeroTypeFilter('ĐỠ ĐÒN', false),
  ];
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xFFE9E9E9),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
                title: Text(
                  'JJ-HEROWIKI',
                ),
                backgroundColor: Colors.black),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        width: 4,
                        color: Colors.yellow.shade700,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.yellow.shade700,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Nhập tên tướng....",
                              hintStyle: TextStyle(
                                color: Colors.yellow[700],
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (String keyword) {},
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.yellow[700],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      // margin: EdgeInsets.only(top: 20),
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 7,
                        children: [
                          for (int i = 0; i < listfilter.length; i++)
                            FilterChip(
                              showCheckmark: false,
                              avatar: listfilter[i].isSelected
                                  ? const Icon(Icons.check, color: Colors.black)
                                  : Icon(Icons.add,
                                      color: Colors.yellow.shade700),
                              labelStyle: TextStyle(
                                color: listfilter[i].isSelected
                                    ? Colors.black
                                    : Colors.yellow.shade700,
                              ),
                              backgroundColor: Colors.black,
                              label: Text(listfilter[i].type),
                              selected: listfilter[i].isSelected,
                              onSelected: (bool value) {
                                setState(() {
                                  listfilter[i].isSelected = value;
                                });
                              },
                              selectedColor: Colors.yellow.shade700,
                              shadowColor: Colors.yellow.shade700,
                              elevation: 15,
                            ),
                        ],
                      ))
                ],
              )
            ]))
          ],
        ));
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/enum/filter_search_type.dart';
import 'package:my_app/models/filter_search_crtl.dart';
import 'package:my_app/util/fake_data.dart';

import '../models/filter_search_data.dart';

class FilerSearchComponent extends StatefulWidget {
  final FilterSearchControl filterControl;

  const FilerSearchComponent({Key? key, required this.filterControl})
      : super(key: key);
  @override
  State<FilerSearchComponent> createState() => _FilerSearchComponent();
}

class _FilerSearchComponent extends State<FilerSearchComponent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FilterSearchControl filterControl = widget.filterControl;
    final String whatWeSearching = filterControl.controlType.label;

    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
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
                    hintText: "Please enter name of $whatWeSearching",
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
                for (int i = 0; i < filterControl.dataSet.length; i++)
                  FilterChip(
                    showCheckmark: false,
                    avatar: filterControl.dataSet[i].isSelected
                        ? const Icon(Icons.check, color: Colors.black)
                        : Icon(Icons.add, color: Colors.yellow.shade700),
                    labelStyle: TextStyle(
                      color: filterControl.dataSet[i].isSelected
                          ? Colors.black
                          : Colors.yellow.shade700,
                    ),
                    backgroundColor: Colors.black,
                    label: Text(filterControl.dataSet[i].label),
                    selected: filterControl.dataSet[i].isSelected,
                    onSelected: (bool value) {
                      setState(() {
                        filterControl.dataSet[i].isSelected = value;
                        // inspect(filterControl.dataSet);
                      });
                    },
                    selectedColor: Colors.yellow.shade700,
                    shadowColor: Colors.yellow.shade700,
                    elevation: 15,
                  ),
              ],
            ))
      ],
    );
  }
}

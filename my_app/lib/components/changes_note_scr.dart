import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fake_data.dart';

class ChangesNotePage extends StatefulWidget {
  @override
  State<ChangesNotePage> createState() => _ChangesNotePage();
}

class _ChangesNotePage extends State<ChangesNotePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: TextButton(onPressed: () {}, child: Text('Test')),
    );
  }
}

import 'package:flutter/material.dart';

import '../screens/changes_note_scr.dart';
import '../screens/hero_wiki_scr.dart';
import '../screens/runes_scr.dart';
import '../util/customize_icons.dart';
import 'home_scr.dart';
import 'more_options_scr.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  final List<Widget> _children = [
    HomePage(),
    ChangesNotePage(),
    RunesPage(),
    HeroWikiPage(),
    MoreOptionsPage()
  ];
  int _currentIndex = 0;

  void onTappedNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          onTap: onTappedNav,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_rounded),
              label: 'News',
            ),
            BottomNavigationBarItem(
                icon: Icon(WeaponIcon.axe), label: 'Weapons'),
            BottomNavigationBarItem(
                icon: Icon(Icons.all_out_outlined), label: 'Runes'),
            BottomNavigationBarItem(
                icon: Icon(WeaponIcon.muscle_up), label: 'Hero wiki'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'More'),
          ],
        ),
      ),
    );
  }
}

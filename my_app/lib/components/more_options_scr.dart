import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/fake_data.dart';
import 'package:my_app/components/home_scr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoreOptionsPage extends StatefulWidget {
  @override
  State<MoreOptionsPage> createState() => _MoreOptionsPageState();
}

class _MoreOptionsPageState extends State<MoreOptionsPage> {
  var listUrl = FakeDataUtility().getImageUrl();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Options'),
              TextButton(onPressed: () {}, child: const Icon(Icons.settings))
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                }),
            items: listUrl.map((i) {
              return Item(imgUrl: i);
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedSmoothIndicator(
            activeIndex: _currentPageIndex,
            count: listUrl.length,
            effect: const JumpingDotEffect(
              dotHeight: 16,
              dotWidth: 16,
              jumpScale: .7,
              verticalOffset: 15,
            ),
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String imgUrl;
  const Item({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            imgUrl,
            width: 1050,
            height: 350,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

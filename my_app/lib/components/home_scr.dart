import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'fake_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class newsCard extends StatelessWidget {
  final String imgUrl;
  const newsCard({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 70),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      imgUrl,
                      width: 350,
                      fit: BoxFit.cover,
                    ))),
            const SizedBox(
              height: 20,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Column(
                  children: const [
                    Text('data'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('data'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('data'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('data'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('data'),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _HomePage extends State<HomePage> {
  var listUrl = FakeDataUtility().getImageUrl();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Stack(
        children: <Widget>[
          // menu(context),
          Positioned(
            top: 62,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.network(
                  'https://cdn.tgdd.vn/2020/05/campaign/butter-640x360.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            top: height * 0.43,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 0, left: 12, right: 15),
                    child: Text(
                      'Recommended for you',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black45,
                          letterSpacing: .5,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            scrollDirection: Axis.horizontal,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            height: 350,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentPageIndex = index;
                              });
                            }),
                        items: listUrl.map((i) {
                          return newsCard(imgUrl: i);
                        }).toList(),
                      ),
                      AnimatedSmoothIndicator(
                          activeIndex: _currentPageIndex,
                          count: listUrl.length,
                          effect: const JumpingDotEffect(
                            dotHeight: 16,
                            dotWidth: 16,
                            jumpScale: .7,
                            verticalOffset: 15,
                          )),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  )),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/detail_news.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/news.dart';
import '../util/fake_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final listUrl = FakeDataUtility().getHightLights();
  final listData = FakeDataUtility().getNews();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
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
                    CarouselSlider(
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          }),
                      items: listUrl.map((i) {
                        return Hightlights(imgUrl: i);
                      }).toList(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentPageIndex,
                        count: listUrl.length,
                        effect: const WormEffect(
                          activeDotColor: Colors.black,
                          dotColor: Colors.grey,
                          dotHeight: 7,
                          dotWidth: 7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DetailNews(objNews: listData[i])));
                    },
                    child: NewsItem(newsObject: listData[i]),
                  );
                },
                childCount: listData.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10),
            )
          ],
        ));
  }
}

// Hightlights
class Hightlights extends StatelessWidget {
  final String imgUrl;
  const Hightlights({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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

//// News item
class NewsItem extends StatelessWidget {
  final News newsObject;
  const NewsItem({required this.newsObject});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5),
          color: Color(0xFFE9E9E9),
          child: Column(children: [
            Image.network(
              newsObject.imgUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.19,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(newsObject.title,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                              fontSize: 20),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(newsObject.description,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: Colors.black87,
                              letterSpacing: .5,
                              fontSize: 14),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8, left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(newsObject.author,
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5,
                                    fontSize: 12),
                              )))),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 11),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(newsObject.time,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Colors.black87,
                                  letterSpacing: .5,
                                  fontSize: 10),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'URLs.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePage();
}

class newsCard extends StatelessWidget{
  final String imgUrl;
  const newsCard({required this.imgUrl});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(right: 20, bottom: 30),
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

                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.network(imgUrl,
                  width: 350,
                  fit: BoxFit.cover,
                ))),
            SizedBox(
              height: 10,
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
                    SizedBox(height: 5,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _HomePage extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:  const Color(0xFFE9E9E9),
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
                child: Image.network('https://cdn.tgdd.vn/2020/05/campaign/butter-640x360.jpg',fit: BoxFit.cover,)
            ),
          ),
          Positioned(
            top:height * 0.45,
            left: 0,
            right: 0,
            child: SizedBox(
              height: height ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(bottom: 0, left: 12, right: 15),
                    child:
                    Text(
                      'Recommended for you',
                      style: GoogleFonts.lato(
                        textStyle:  const TextStyle(color: Colors.red, letterSpacing: .5, fontSize: 20, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:Row(
                        children: <Widget>[
                          const SizedBox(

                            width:10,
                          ),
                          for (int i = 0; i< listUrl.length; i++)
                            newsCard(imgUrl: listUrl.elementAt(i))
                        ],
                      ) ,
                    ),
                  ),Expanded(child: Container(

                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
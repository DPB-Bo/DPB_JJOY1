import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/news.dart';

class DetailNews extends StatefulWidget {
  final News objNews;
  const DetailNews({Key? key, required this.objNews}) : super(key: key);
  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    var _objNews = widget.objNews;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: WebView(
        initialUrl: _objNews.imgUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

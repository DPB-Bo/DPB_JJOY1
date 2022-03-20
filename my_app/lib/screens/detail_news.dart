import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNews extends StatefulWidget {
  const DetailNews({Key? key}) : super(key: key);

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const WebView(
        initialUrl:
            'https://lienquan.garena.vn/tin-tuc/dieu-chinh-suc-manh-tuong-ban-cap-nhat-vuong-quoc-rong33',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final String title;
  const WebViewContainer({
    Key? key,
    required this.title,
    this.url,
  }) : super(key: key);
  @override
  createState() => _WebViewContainerState(url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: GestureDetector(
            child: Center(
              child: SvgPicture.asset(AssetsPath.icArrowLeftCircle),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(widget.title,
              style:
                  CustomTextStyle.WHITE_HEADER_24.apply(color: Colors.black)),
        ),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}

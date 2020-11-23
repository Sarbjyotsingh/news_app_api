import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/utilities/colors.dart';
import 'package:news_app_api/utilities/values.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteView extends StatefulWidget {
  final String url;
  WebsiteView({
    @required this.url,
  });
  @override
  _WebsiteViewState createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  WebViewController _controller;
  bool _isLoading = true;

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            isIOS ? Icons.keyboard_arrow_left : Icons.keyboard_backspace,
            size: 40,
            color: primaryColor,
          ),
        ),
        backgroundColor: whiteColor,
        actions: [
          _isLoading
              ? CupertinoActivityIndicator(
                  radius: 20,
                )
              : IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: primaryColor,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.reload();
                  },
                ),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}

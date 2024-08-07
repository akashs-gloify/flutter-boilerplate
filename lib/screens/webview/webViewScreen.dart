import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: data["link"],
        navigationDelegate: (NavigationRequest request) {
          return data["link"];
        },
      ),
    );
  }
}

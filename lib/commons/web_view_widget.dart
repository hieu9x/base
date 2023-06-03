import 'package:auto_route/auto_route.dart';
import 'package:base/global/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../global/app_themes.dart';

@RoutePage()
class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    super.key,
    required this.url,
    this.title = '',
  });
  final String url;
  final String title;

  @override
  WebViewWidgetState createState() => WebViewWidgetState();
}

class WebViewWidgetState extends State<WebViewWidget> {
  double progress = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.backgroundColor,
        title: Text(
          widget.title,
          style: AppThemes.lightTextTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                userAgent:
                    "Mozilla/5.0 Google (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.0.0 Mobile Safari/537.36 Mozilla/5.0(iPad; U;CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10(KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10",
                cacheEnabled: false,
                clearCache: true,
              ),
            ),
            androidOnPermissionRequest: (controller, origin, resources) async {
              return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
            },
            onLoadError: (controller, uri, code, message) {
              if (uri.toString().startsWith(AppConstants.signInCallBack)) {
                final String authCode = uri?.queryParameters["code"] ?? '';
                if (authCode != '') {
                  Navigator.pop(context, authCode);
                }
              }
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
          ),
          progress < 1.0
              ? const LinearProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/providers/PageDetailProvider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewCntrl {

  late final WebViewController _controller;

  WebViewController get controller => _controller;

  setcCntroller(WebViewController value) {
    _controller = value;
  }

  void setWebController(
      String url, BuildContext context, PageDetailProvider pageDetailProvider) {
    late final PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            pageDetailProvider.setisPageStatus(false);
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            pageDetailProvider.setisPageStatus(true);
            debugPrint('Page finished loading: $url');
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    setcCntroller(controller);
  }
}

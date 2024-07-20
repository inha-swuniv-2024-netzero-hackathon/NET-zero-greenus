import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/planet_controller.dart';

class PlanetView extends BaseView<PlanetController> {
  const PlanetView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri.uri(Uri.parse('http://planethostbucket.s3-website.ap-northeast-2.amazonaws.com')),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:greenus/core/base/base_view.dart';

import '../controllers/planet_controller.dart';

class PlanetView extends BaseView<PlanetController> {
  const PlanetView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext ctontext) {
    return Container(child: Text('planet_view'),);
  }

}
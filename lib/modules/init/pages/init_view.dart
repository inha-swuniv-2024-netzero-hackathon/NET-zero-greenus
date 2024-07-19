import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:greenus/core/base/base_view.dart';
import 'package:greenus/modules/init/controllers/init_controller.dart';

class InitView extends BaseView<InitController> {
  const InitView({super.key});

  @override
  PreferredSize? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      child: Text('init'),
    );
  }
}

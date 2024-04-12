import 'package:flutter/material.dart';
import 'package:pera_soft1/product/base/widget/custom_appbar_widget.dart';
import '../../../../product/constants/string/string_constants.dart';
import '../widget/future_builder_widget.dart';

class TopListPage extends StatelessWidget {
  const TopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(appBarTitle: StringConstants.enPahaliUrunler),
      body: FutureBuilderWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import '../widget/image_asset_widget.dart';
import '../widget/outlined_button_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
          const ImageAssetWidget(),
            Positioned(
              top: context.width * 1.5,
              left: context.veryhighValue2x * 0.7,
              child:const OutlinedButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

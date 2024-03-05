import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:pera_soft1/product/utils/image_assets_constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              ImageConstants.landingPageImage,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: context.width * 1.5,
              left: context.veryhighValue2x * 0.7,
              child: OutlinedButton(
                onPressed: () {
                  context.go("/home_page");
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor:  CustomColorScheme.appBarBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: const BorderSide(
                      color: CustomColorScheme.circleHover, width: 2.0),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Text(
                    'HEMEN BAŞLA',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

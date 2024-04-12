import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import '../../../../product/constants/string/string_constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/home_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorScheme.customBottomNavColor,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                radius: context.dynamicHeight(0.1),
                backgroundColor: CustomColorScheme.customButtonColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.dynamicWidth(0.25)),
              child: Center(
                child: Text(StringConstants.landingText,
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: CustomColorScheme.textColorwhite,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

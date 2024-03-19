
import 'package:flutter/material.dart';

import '../../../../product/utils/image/image_assets_constants.dart';

final class ImageAssetWidget extends StatelessWidget {
  const ImageAssetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageConstants.landingPageImage,
      fit: BoxFit.cover,
    );
  }
}

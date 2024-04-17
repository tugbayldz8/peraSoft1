part of '../home_page.dart';

final class _SearchBarView extends StatelessWidget {
  const _SearchBarView();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: context.highValue,
            width: context.veryhighValue4x / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColorScheme.textColorwhite,
            ),
            child: Row(
              children: [
                Padding(
                  padding: context.paddingAllLow,
                  child: const Icon(Icons.search,
                      color: CustomColorScheme.customButtonColor),
                ),
                Text(
                  StringConstants.search,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQueryExtension(context).lowValue,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundColor: CustomColorScheme.customButtonColor,
            radius: 20,
            child: Icon(
              color: CustomColorScheme.textColorwhite,
              Icons.qr_code,
            ),
          ),
        ),
      ],
    );
  }
}

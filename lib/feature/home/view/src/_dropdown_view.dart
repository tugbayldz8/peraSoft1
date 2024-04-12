part of '../home_page.dart';

class LocDropdownView extends StatefulWidget {
  const LocDropdownView({super.key});

  @override
  State<LocDropdownView> createState() => LocDropdownViewState();
}

class LocDropdownViewState extends State<LocDropdownView>
    with LocDropdownMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: CustomColorScheme.customButtonColor,
          ),
          Consumer<DropdownProvider>(
            builder: (context, provider, child) {
              return DropdownButton<String>(
                value: provider.selectedItem,
                onChanged: (String? newValue) {
                  setSelectedItem(newValue, provider);
                },
                items: provider.items
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
            },
          ),
          SizedBox(width: MediaQueryExtension(context).veryhighValue1x * 0.8),
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () async {
              final result = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: backgorundColor,
                  barrierColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (context) {
                    return const _BottomSheetView();
                  });
              if (result is bool) {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}

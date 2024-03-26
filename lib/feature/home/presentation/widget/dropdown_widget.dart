import 'package:flutter/material.dart';
import 'package:pera_soft1/feature/home/provider/dropdown_provider.dart';
import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:pera_soft1/product/theme/custom_color_scheme.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_widget.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  Color backgorundColor = Colors.white;
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
                  if (newValue != null) {
                    provider.setSelectedItem(newValue);
                  }
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
                  backgroundColor: Colors.red,
                  barrierColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (context) {
                    return BottomSheetWidget();
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

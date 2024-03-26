import 'package:pera_soft1/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

final class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String? _selectedCategory;
  String? _selectedPriceRange;

  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  List<String> priceRanges = [
    'Price Range 1',
    'Price Range 2',
    'Price Range 3'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 30,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Text('Filter options'),
                  Positioned(
                    left: 10,
                    top: -10,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop<bool>(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.close),
                        )),
                  ),
                  Positioned(
                    right: 10,
                    top: -10,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop<bool>(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              Navigator.of(context).pop<bool>(true);
                            },
                            child: Text('Done'),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green,
              child: DropdownButton<String>(
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text('Select Price Range:'),
            DropdownButton<String>(
              value: _selectedPriceRange,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPriceRange = newValue;
                });
              },
              items: priceRanges.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Fetch Data'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop<bool>(true);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

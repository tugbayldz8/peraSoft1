part of '../home_page.dart';

final class _BottomSheetView extends StatefulWidget {
  const _BottomSheetView();

  @override
  State<_BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<_BottomSheetView> {
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
                  const Text('Filter options'),
                  Positioned(
                    left: 10,
                    top: -10,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop<bool>(true);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
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
                            child: const Text('Done'),
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
            const SizedBox(height: 20),
            const Text('Select Price Range:'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Fetch Data'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop<bool>(true);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

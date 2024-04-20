part of '../home_page.dart';

final class _BottomSheetView extends StatefulWidget {
  const _BottomSheetView();

  @override
  State<_BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<_BottomSheetView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColorScheme.customBottomNavColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.read<HomeBloc>().add(ClearFilteredListEvent());
                      Navigator.of(context).pop<bool>(true);
                    },
                    icon: const Icon(Icons.close,
                        color: CustomColorScheme.textColorwhite)),
                const Spacer(),
                const Text('Filter options',
                    style: TextStyle(
                        color: CustomColorScheme.customBottomNavColor,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColorScheme.customButtonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    context.read<HomeBloc>().add(FilterProductListEvent());
                    Navigator.of(context).pop<bool>(true);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(color: CustomColorScheme.textColorwhite),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state.categories == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListTile(
                title: const Text('Category Name',
                    style: TextStyle(
                        color: CustomColorScheme.customBottomNavColor,
                        fontWeight: FontWeight.bold)),
                subtitle: DropdownButton<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  value: state.selectCategory,
                  onChanged: (String? newValue) {
                    context.read<HomeBloc>().add(SelectCategoryAndPriceEvent(
                          selectCategory: newValue,
                        ));
                  },
                  items: state.categories!
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              );
            }),
            const SizedBox(height: 20),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ListTile(
                  title: const Text('Price',
                      style: TextStyle(
                          color: CustomColorScheme.customBottomNavColor,
                          fontWeight: FontWeight.bold)),
                  subtitle: DropdownButton<PriceRange>(
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: state.selectPrice,
                    onChanged: (PriceRange? newValue) {
                      if (newValue == null) {
                        return;
                      }
                      context.read<HomeBloc>().add(SelectCategoryAndPriceEvent(
                            selectPrice: newValue,
                          ));
                    },
                    items: PriceRange.values
                        .map<DropdownMenuItem<PriceRange>>((PriceRange value) {
                      return DropdownMenuItem<PriceRange>(
                        value: value,
                        child: Text(value.label),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

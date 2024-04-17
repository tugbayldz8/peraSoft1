part of '../home_page.dart';

class LocationDropdownView extends StatelessWidget {
  LocationDropdownView({super.key});

  final List<String> _items = [
    'Zihuatanejo, Gro',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
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
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return DropdownButton<String>(
                value: state.selectedAddress,
                onChanged: (String? newValue) {
                  if (newValue == null) return;
                  context.read<HomeBloc>().add(LocationChangeEvent(newValue));
                },
                items: _items.map<DropdownMenuItem<String>>((String value) {
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
              await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  barrierColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (context) {
                    return const _BottomSheetView();
                  });
            },
          ),
        ],
      ),
    );
  }
}

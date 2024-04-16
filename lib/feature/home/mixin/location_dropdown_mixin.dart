part of '../view/home_page.dart';

mixin LocationDropdownMixin on State<LocationDropdownView> {
  void setSelectedItem(String? newValue, LocationDropdownViewModel provider) {
    if (newValue != null) {
      provider.setSelectedItem(newValue);
    }
  }

  Color backgorundColor = Colors.white;
}

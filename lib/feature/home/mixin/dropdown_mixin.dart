part of '../view/home_page.dart';

mixin LocDropdownMixin on State<LocDropdownView> {
  void setSelectedItem(String? newValue, DropdownProvider provider) {
    if (newValue != null) {
      provider.setSelectedItem(newValue);
    }
  }

  Color backgorundColor = Colors.white;
}

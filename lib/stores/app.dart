import 'package:flutter/material.dart';

class AppStore extends InheritedWidget {
  final ValueNotifier<List<Page>> pages = ValueNotifier([]);

  AppStore({required Widget child}) : super(child: child);

  static AppStore of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppStore>()!;

  void addPage(Page page) => this.pages.value = [...this.pages.value, page];

  @override
  bool updateShouldNotify(covariant AppStore oldWidget) =>
      oldWidget.pages.value != this.pages.value;
}

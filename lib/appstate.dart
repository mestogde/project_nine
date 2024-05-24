import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final String data;
  final Function(String) updateData;
  final Widget child;

  AppState({required this.data, required this.updateData, required this.child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant AppState oldWidget) {
    return data != oldWidget.data;
  }

  static AppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>();
  }
}

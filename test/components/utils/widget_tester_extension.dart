import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesting on WidgetTester {
  Future<void> pumpMaterialComponent(Widget component) async {
    await this.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: component,
        ),
      ),
    );
  }
}

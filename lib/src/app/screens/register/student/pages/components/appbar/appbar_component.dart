import 'package:flutter/material.dart';
import 'package:navigations/src/theme/theme_class.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: ColorSchemeManagerClass.colorSecondary),
      backgroundColor: ColorSchemeManagerClass.colorPrimary,
    );
  }
}

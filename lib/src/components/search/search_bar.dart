import 'package:flutter/material.dart';
import 'package:navigations/src/theme/theme_class.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SearchBarAnimation(
        hintText: 'Pesquise',
        searchBoxWidth: MediaQuery.sizeOf(context).width / 3,
        isSearchBoxOnRightSide: true,
        trailingWidget: Icon(
          Icons.search,
          size: 20,
          color: ColorSchemeManagerClass.colorPrimary,
        ),
        secondaryButtonWidget: Icon(
          Icons.close,
          size: 20,
          color: ColorSchemeManagerClass.colorPrimary,
        ),
        buttonBorderColour: Colors.transparent,
        buttonWidget: Icon(
          Icons.search,
          size: 20,
          color: ColorSchemeManagerClass.colorPrimary,
        ),
        buttonShadowColour: Colors.transparent,
        buttonElevation: 0.0,
        enableBoxBorder: true,
        enableBoxShadow: true,
        enableButtonBorder: true,
        enableButtonShadow: true,
        enableKeyboardFocus: true,
        searchBoxBorderColour: ColorSchemeManagerClass.colorPrimary,
        textEditingController: TextEditingController(),
        isOriginalAnimation: true,
        onFieldSubmitted: (String value) {
          debugPrint('onFieldSubmitted value $value');
        },
      ),
    );
  }
}

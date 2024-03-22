import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  final ListView drawerContent;

  const DrawerComponent({super.key, required this.drawerContent});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: widget.drawerContent,
    );
  }
}


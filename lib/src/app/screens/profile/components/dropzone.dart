import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigations/src/theme/theme_class.dart';

class DropZone extends StatefulWidget {
  const DropZone({super.key});

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  bool isLoading = false;
  final imagePicker = ImagePicker();
  File? imageFile;

  Future<void> pick(ImageSource source) async {
    setState(() {
      isLoading = true;
    });
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        imageFile = File(pickedFile.path);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  final List<Icon> iconsList = [
    Icon(Icons.image_outlined, color: Colors.grey[500]),
    Icon(Icons.camera_alt_outlined, color: Colors.grey[500]),
    Icon(Icons.delete_forever_outlined, color: Colors.grey[500]),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 87,
          backgroundColor: ColorSchemeManagerClass.colorPrimary,
          child: CircleAvatar(
            radius: 85,
            backgroundColor: ColorSchemeManagerClass.colorSecondary,
            backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
          ),
        ),
        if (isLoading)
          const Positioned.fill(
            child: CircularProgressIndicator(),
          ),
        Positioned(
          bottom: 5,
          right: 5,
          child: CircleAvatar(
            child: CircleAvatar(
              backgroundColor: ColorSchemeManagerClass.colorPrimary,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ListTile(
                              focusColor: ColorSchemeManagerClass.colorPrimary,
                              leading: iconsList[0],
                              title: const Text(
                                'Galeria',
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                pick(ImageSource.gallery);
                              },
                            ),
                            ListTile(
                              leading: iconsList[1],
                              title: const Text(
                                'Câmera',
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                pick(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: iconsList[2],
                              title: const Text(
                                'Remover',
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  imageFile = null;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: ColorSchemeManagerClass.colorSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

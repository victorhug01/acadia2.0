import 'dart:io';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigations/src/theme/theme_class.dart';

class DropZone extends StatefulWidget {
  const DropZone({super.key});

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  final Set<Uri> files = {};
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

  final List<XFile> _list = [];

  bool dragging = false;

  Offset? offset;

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
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  pick(ImageSource.gallery);
                                },
                                child: DropTarget(
                                  onDragDone: (detail) async {
                                    setState(() {
                                      _list.clear();
                                      _list.addAll(detail.files);
                                      isLoading = true;
                                    });

                                    debugPrint('onDragDone:');
                                    for (final file in detail.files) {
                                      debugPrint('  ${file.path} ${file.name}'
                                          '  ${await file.lastModified()}'
                                          '  ${await file.length()}'
                                          '  ${file.mimeType}');
                                    }
                                    Navigator.of(context).pop();

                                    await Future.delayed(
                                        const Duration(seconds: 2));

                                    //mesagem
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Item arrastado com sucesso!'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );

                                    setState(() {
                                      final List<String> filePaths = _list
                                          .map((file) => file.path)
                                          .toList();

                                      if (filePaths.isNotEmpty) {
                                        imageFile = File(filePaths.first);
                                      }
                                      isLoading = false;
                                    });
                                  },
                                  onDragUpdated: (details) {
                                    setState(() {
                                      offset = details.localPosition;
                                    });
                                  },
                                  onDragEntered: (detail) {
                                    setState(() {
                                      dragging = true;
                                      offset = detail.localPosition;
                                    });
                                  },
                                  onDragExited: (detail) {
                                    setState(() {
                                      dragging = false;
                                      offset = null;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: ColorSchemeManagerClass
                                            .colorPrimary,
                                        width: 3,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.cloud_upload_outlined,
                                          size: 60,
                                          color: ColorSchemeManagerClass
                                              .colorPrimary,
                                        ),
                                        Text(
                                          'Arraste ou clique aqui',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ColorSchemeManagerClass
                                                  .colorPrimary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
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

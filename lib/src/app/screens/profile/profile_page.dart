import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigations/src/theme/theme_class.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  final imagePicker = ImagePicker();
  File? imageFile;
  pick(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width >= 650
              ? 400
              : MediaQuery.sizeOf(context).width / 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: ColorSchemeManagerClass.colorPrimary,
              width: 3,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 78,
                          backgroundColor: ColorSchemeManagerClass.colorPrimary,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.grey[400],
                            backgroundImage: imageFile != null
                                ? (FileImage(imageFile!))
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[600],
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
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                child: Center(
                                                  child: Icon(
                                                    Icons.image_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ),
                                              title: const Text(
                                                'Galeria',
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                pick(ImageSource.gallery);
                                              },
                                            ),
                                            ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                child: Center(
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ),
                                              title: const Text(
                                                'Câmera',
                                              ),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                pick(ImageSource.camera);
                                              },
                                            ),
                                            ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                child: Center(
                                                  child: Icon(
                                                    Icons
                                                        .delete_forever_outlined,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ),
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
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('Keyla Rodrigues'),
                  const Text('45 anos'),
                  const Text('Secretária')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 87,
                                backgroundColor:
                                    ColorSchemeManagerClass.colorPrimary,
                                child: CircleAvatar(
                                  radius: 85,
                                  backgroundColor:
                                      ColorSchemeManagerClass.colorSecondary,
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
                                    backgroundColor:
                                        ColorSchemeManagerClass.colorPrimary,
                                    child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (_) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    leading: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey[200],
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.image_outlined,
                                                          color:
                                                              Colors.grey[500],
                                                        ),
                                                      ),
                                                    ),
                                                    title: const Text(
                                                      'Galeria',
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      pick(ImageSource.gallery);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey[200],
                                                      child: Center(
                                                        child: Icon(
                                                          Icons
                                                              .camera_alt_outlined,
                                                          color:
                                                              Colors.grey[500],
                                                        ),
                                                      ),
                                                    ),
                                                    title: const Text(
                                                      'Câmera',
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                                          color:
                                                              Colors.grey[500],
                                                        ),
                                                      ),
                                                    ),
                                                    title: const Text(
                                                      'Remover',
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                        color: ColorSchemeManagerClass
                                            .colorSecondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Column(
                            children: [
                              Text('Maria Fernanda'),
                              Text('17 anos'),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Secretária'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: ColorSchemeManagerClass.colorPrimary,
                  height: 2.0,
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('Observações'),
                              Text('(Pressão baixa)'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('(14) 98236 - 5478'),
                            ],
                          ),
                        ),
                        Text('mariafernanda@objetivo.com'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

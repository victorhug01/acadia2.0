import 'package:flutter/material.dart';
import 'package:navigations/src/theme/theme_class.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorSchemeManagerClass.colorSecondary),
        backgroundColor: ColorSchemeManagerClass.colorPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: ColorSchemeManagerClass.colorPrimary,
              width: 3.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: 30000,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0.0),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        side: WidgetStatePropertyAll(
                          BorderSide(
                            color: ColorSchemeManagerClass.colorPrimary,
                            width: 3.0,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              leading: SizedBox(
                                width: 100,
                                child: Image.asset('assets/woman_image.jpg'),
                              ),
                              title: const Text('Monique Santos'),
                            ),
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('9854321874'),
                              const SizedBox(width: 20.0),
                              const Text('2º ano'),
                              const SizedBox(width: 20.0),
                              Text(index.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigations/src/theme/theme_class.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({super.key});

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: ColorSchemeManagerClass.colorPrimary,
              width: 3,
            ),
          ),
          height: double.infinity,
          child: Form(
            child: ListView(
              children: const [
                Column(
                  children: [
                    Text('data'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigations/src/app/screens/register/student/pages/register_student/pay_methods.dart';
import 'package:navigations/src/app/screens/register/student/pages/register_student/register_responsible.dart';
import 'package:navigations/src/app/screens/register/student/pages/register_student/register_student.dart';
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
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorSchemeManagerClass.colorPrimary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Row(
                        children: [
                          ListTile(
                            
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

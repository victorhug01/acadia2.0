import 'package:flutter/material.dart';
import 'package:navigations/src/app/screens/profile/components/dropzone.dart';
import 'package:navigations/src/theme/theme_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  static const TextStyle styletext =  TextStyle(
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: MediaQuery.of(context).size.width >= 650
              ? 400
              : MediaQuery.of(context).size.width / 1,
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
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DropZone(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Column(
                            children: [
                              Text('Maria Fernanda',style: styletext,),
                              Text('17 anos', style: styletext,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Secretária', style: styletext,),
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
                              Text('Observações', style: styletext,),
                              Text('(Pressão baixa)', style: styletext,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('(14) 98236 - 5478', style: styletext,),
                            ],
                          ),
                        ),
                        Text('mariafernanda@objetivo.com', style: styletext,),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigations/src/app/screens/chat/chat_page.dart';
import 'package:navigations/src/app/screens/profile/profile_page.dart';
import 'package:navigations/src/app/screens/register/student/student_page.dart';
import 'package:navigations/src/components/drawer/drawer_component.dart';
import 'package:navigations/src/components/search/search_bar.dart';
import 'package:navigations/src/theme/theme_class.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acadia',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MediaQuery.sizeOf(context).width >= 770
      ? const DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: NavigationsTabsComponents(),
      ) :const NavigationsTabsComponents(),
    );
  }
}

class NavigationsTabsComponents extends StatefulWidget {
  const NavigationsTabsComponents({super.key});

  @override
  State<NavigationsTabsComponents> createState() =>
      _NavigationsTabsComponentsState();
}

final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Botão menu');
@override
void dispose() {
  _buttonFocusNode.dispose();
}

class _NavigationsTabsComponentsState extends State<NavigationsTabsComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerComponent(),
      appBar: AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
        title: MediaQuery.of(context).size.width >= 770
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 230,
                    child: TabBar(
                      tabs: [
                        Tab(text: "Perfil"),
                        Tab(text: "Chat"),
                        Tab(text: "Home"),
                      ],
                    ),
                  ),
                  MenuAnchor(
                    childFocusNode: _buttonFocusNode,
                    style: MenuStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        ColorSchemeManagerClass.colorPrimary,
                      ),
                    ),
                    menuChildren: [
                      MenuItemButton(
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorSchemeManagerClass.colorSecondary,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            child: Text(
                              'Estudante',
                              style: TextStyle(
                                color: ColorSchemeManagerClass.colorPrimary,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const StudentPage()));
                        },
                      ),
                      MenuItemButton(
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorSchemeManagerClass.colorSecondary,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            'Contratado',
                            style: TextStyle(
                              color: ColorSchemeManagerClass.colorPrimary,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                    builder: (BuildContext context, MenuController controller,
                        Widget? child) {
                      return TextButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        focusNode: _buttonFocusNode,
                        onPressed: (){
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                        child: const Text('Cadastrar'),
                      );
                    },
                  ),
                ],
              )
            : null,
        actions: [
          MediaQuery.of(context).size.width >= 770
              ? const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: SearchBarWidget(),
                )
              : Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: ColorSchemeManagerClass.colorPrimary,
                      ),
                    );
                  },
                ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15),
          child: Container(
            height: 15,
            color: ColorSchemeManagerClass.colorPrimary,
          ),
        ),
      ),
      body: MediaQuery.sizeOf(context).width >= 770
      ? const TabBarView(
        children: [
          ProfilePage(),
          ChatPage(),
          Icon(Icons.directions_bike),
        ],
      ) :
      const ProfilePage()
    );
  }
}

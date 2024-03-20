import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigations/src/app/screens/profile/profile_page.dart';
import 'package:navigations/src/components/drawer/drawer_component.dart';
import 'package:navigations/src/components/search/search_bar.dart';
import 'package:navigations/src/theme/theme_class.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: NavigationsTabsComponents(),
      ),
    );
  }
}

class NavigationsTabsComponents extends StatefulWidget {
  const NavigationsTabsComponents({super.key});

  @override
  State<NavigationsTabsComponents> createState() =>
      _NavigationsTabsComponentsState();
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
        title: MediaQuery.of(context).size.width >= 730
            ? const SizedBox(
                width: 300,
                child: TabBar(
                  tabs: [
                    Tab(text: "Perfil"),
                    Tab(text: "Chat"),
                    Tab(text: "Home"),
                  ],
                ),
              )
            : null,
        actions: [
          MediaQuery.of(context).size.width >= 730
              ? const SearchBarWidget()
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
      body: const TabBarView(
        children: [
          ProfilePage(),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}

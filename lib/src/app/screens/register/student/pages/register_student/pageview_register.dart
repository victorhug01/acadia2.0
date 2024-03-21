import 'package:flutter/material.dart';
import 'package:navigations/src/app/screens/register/student/pages/components/appbar/appbar_component.dart';
import 'package:navigations/src/app/screens/register/student/pages/register_student/pay_methods.dart';
import 'package:navigations/src/app/screens/register/student/pages/register_student/register_responsible.dart';
import 'package:navigations/src/app/screens/register/student/pages/register_student/register_student.dart';
import 'package:navigations/src/theme/theme_class.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class PageViewRegister extends StatefulWidget {
  const PageViewRegister({super.key});

  @override
  State<PageViewRegister> createState() => _PageViewRegisterState();
}

class _PageViewRegisterState extends State<PageViewRegister> {
  late int selectedPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> pages = const [
    RegisterStudent(),
    RegisterResponsibleStudent(),
    PayMethods()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBarComponent(),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            selectedPage = page;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedPage == 0
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.adaptive.arrow_back,
                        color: Colors.transparent,
                      ),
                      disabledColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      mouseCursor: MouseCursor.uncontrolled,
                    )
                  : IconButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.adaptive.arrow_back),
                    ),
              SizedBox(
                width: 200,
                child: PageViewDotIndicator(
                  currentItem: selectedPage,
                  count: pages.length,
                  unselectedColor: Colors.black26,
                  selectedColor: ColorSchemeManagerClass.colorPrimary,
                  fadeEdges: true,
                  duration: const Duration(milliseconds: 200),
                  boxShape: BoxShape.circle,
                  onItemClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  if (selectedPage < pages.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                icon: Icon(Icons.adaptive.arrow_forward_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

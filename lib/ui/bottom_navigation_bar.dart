import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:courses/ui/about%20page/about_page.dart';
import 'package:courses/ui/free%20courses%20page/free_courses_page.dart';
import 'package:courses/ui/home%20page/home_page.dart';
import 'package:flutter/material.dart';
import '../flutter localizations/demoLocalizations.dart';
import 'home page/constants.dart';
import 'notes/notes_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
    // bottom navigation bar
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const MyHomePage(),
    const FreeCoursesPage(),
    const NotesPage(),
    const AboutPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 59,
        decoration: BoxDecoration( gradient: kGradint,),
        child: BottomNavyBar(
          backgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          itemCornerRadius: 10,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.apps),
                title: Text('${DemoLocalizations.of(context).getTranslatedValues("home")}'),
                activeColor: Colors.white,
                textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.card_giftcard_outlined),
                title:  Text('${DemoLocalizations.of(context).getTranslatedValues("ComingSoon")}'),
                activeColor: Colors.white,
                textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.note_alt),
                title:  Text( '${DemoLocalizations.of(context).getTranslatedValues("Notes")}'),
                activeColor:Colors.white,
                textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.info),
                title: Text('${DemoLocalizations.of(context).getTranslatedValues("info")}'),
                activeColor: Colors.white,
                textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class _pageController {
  static void animateToPage(int index, {required Duration duration, required Cubic curve}) {}
}
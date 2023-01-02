import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../shared_preferences.dart';
import '../bottom_navigation_bar.dart';
class IntroOverboardPage extends StatefulWidget {
  const IntroOverboardPage({Key? key}) : super(key: key);

  @override
  State<IntroOverboardPage> createState() => _IntroOverboardPageState();
}

class _IntroOverboardPageState extends State<IntroOverboardPage> {
  bool isDone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Courses For You',
              body: 'Everything is in your hands.',
              image: buildImage("images/1.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'udemy coupons',
              body: '100% off udemy coupons for free with certification',
              image: buildImage("images/6.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Learn Everything',
              body: 'Different courses in all disciplines and in several languages',
              image: buildImage("images/3.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {

            SharedPreference.saveUserLoggedInStatus(isDone);
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const BottomNavigationBarPage(),));

          },
          onSkip: () {
            SharedPreference.saveUserLoggedInStatus(isDone);
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => const BottomNavigationBarPage(),));
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip:
          const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done:
          const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
          imagePath,
          width: 450,
          height: 500,
        ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 100),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 30),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
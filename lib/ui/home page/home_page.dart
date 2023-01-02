import 'package:courses/ui/home%20page/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../flutter localizations/demoLocalizations.dart';
import '../../flutter localizations/language.dart';
import '../../main.dart';
import '../notification page/notification_page.dart';
import 'constants.dart';
import 'courses_listview.dart';

Language lang = Language(1, '🇺🇸', "English", 'en');

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _changeLanguage(Language lang) async {
    Locale temp;
    switch (lang.languageCode) {
      case 'en':
        temp = Locale(lang.languageCode, 'US');
        break;
      case 'ar':
        temp = Locale(lang.languageCode, 'SA');

        break;
      default:
        temp = Locale(lang.languageCode, 'US');
    }
    // Get.updateLocale(_temp);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("languageCode", temp.languageCode);
    prefs.setString("countryCode", temp.countryCode!);
    MyApp.setLocale(context, temp);
  }

  // List<String> selectedCategory = ['Development'];
  String text = 'Development';
  List<String> selectedCategory = ['All'];

  final List<String> categories = [
    'All',
    'Development',
    'IT & Software',
    'Design',
    'Marketing',
    'Business',
    'Finance & Accounting',
    'Office Productivity',
    'Personal Development',
    'Lifestyle',
    'Photography & Video',
    'Health & Fitness',
    'Music',
    'Teaching & Academics',
  ];
  final List<String> categoryImages = [
    'all',
    'development',
    'iit',
    'design_icon',
    'marketing',
    'business',
    'finance',
    'office',
    'personal',
    'lifestyle',
    'photography',
    'fitness',
    'music',
    'Teaching',
  ];

  @override
  Widget build(BuildContext context) {
    var heightx1 = MediaQuery.of(context).size.height * 0.8;
    var widthx1 = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text('Courses for you'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
              )
            ],
            color: kAppbarColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: kGradint,
          ),
        ),
        leading: TextButton(
          onPressed: () {
            if (lang.id == 1) {
              lang = Language(2, '🇸🇦', "العربية", 'ar');
              _changeLanguage(lang);
            } else {
              lang = Language(1, '🇺🇸', "English", 'en');
              _changeLanguage(lang);
            }
          },
          child: Row(
            children: [
              const Icon(
                Icons.language,
                color: Colors.white,
              ),
              Text(
                '${DemoLocalizations.of(context).getTranslatedValues("language")}',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  )
              );
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
            child: SearchBar(),
          ),

// CategoriesListView

          SizedBox(
            height: heightx1 * 0.25,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!selectedCategory.contains(categories[index])) {
                          selectedCategory
                              .replaceRange(0, 1, [categories[index]]);
                        } else {}
                      });
                    },
                    child: SizedBox(
                      width: widthx1 * 0.44,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient:
                                  selectedCategory.contains(categories[index])
                                      ? kGradint
                                      : const LinearGradient(
                                          colors: [Colors.white, Colors.white],
                                        ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFF41c4ff),
                                    spreadRadius: 1.5,
                                    blurRadius: 2)
                              ],
                            ),
                            height: heightx1 * 0.18,
                            width: widthx1 * 0.37,
                            child: Padding(
                              padding: const EdgeInsets.all(33.0),
                              child: Image.asset(
                                'images/${categoryImages[index]}.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            categories[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),

          const SizedBox(
            height: 12,
          ),
          const Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
            height: 2,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 12,
          ),
          CoursesListView(selectedCategory: selectedCategory[0]),
        ],
      )),
    );
  }
}

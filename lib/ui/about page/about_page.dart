import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter localizations/demoLocalizations.dart';
import '../home page/constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              //=========================================
              // Profile Image With Camera Icon & Name
              //=========================================
              Container(
                height: 250.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Stack(
                          fit: StackFit.loose,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            //================
                            //Profile Image
                            //================
                            _buildProfileImage(),

                            //=============
                            //Camera Icon
                            //=============
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 100.0, right: 90.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                )),
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                          '${DemoLocalizations.of(context).getTranslatedValues("appName")}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),

              const Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
                height: 2,
                thickness: 0.5,
              ),
              //=============
              //     Info
              //=============
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Text(
                                      '${DemoLocalizations.of(context).getTranslatedValues("Version")}',
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 6.0),
                                  child: Text('1.0.4')),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Text(
                                      '${DemoLocalizations.of(context).getTranslatedValues("LastUpdate")}',
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 6.0),
                                  child: Text('Nov 2022')),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Text(
                                      '${DemoLocalizations.of(context).getTranslatedValues("developedBy")}',
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                     padding: const EdgeInsets.all(0),
                                    alignment: Alignment.topCenter,
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(
                                        "mailto:mohmedmahmoud3@gmail.com");
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: const Text('mohamed mahmoud'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                          )),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                        height: 2,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                ),
              ),

              //===================
              //Bottom Section
              //===================
              BottomSection()
            ],
          ),
        ],
      ),
    );
  }

  _buildProfileImage() {
    return const Image(
      image: AssetImage('images/logo2.png'),
      height: 140,
      width: 140,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

//=======================
// Build bottom Profile
//=======================
class BottomSection extends StatefulWidget {
  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection>
    with TickerProviderStateMixin {
  late List<Tab> _tabs;
  late List<Widget> _pages;
  late TabController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabs = [
  //     const Tab(text: 'Follow us'),
  //     const Tab(text: 'About'),
  //     // Tab(text: '${DemoLocalizations.of(context).getTranslatedValues("FollowUs")}'),
  //     // Tab(text: '${DemoLocalizations.of(context).getTranslatedValues("About")}'),
  //   ];
  //   _pages = [
  //
  //     Skills(),
  //     About(),
  //   ];
  //   _controller = TabController(
  //     length: _tabs.length,
  //     vsync: this,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    _tabs = [
      Tab(
          text:
              '${DemoLocalizations.of(context).getTranslatedValues("FollowUs")}'),
      Tab(
          text:
              '${DemoLocalizations.of(context).getTranslatedValues("About")}'),
    ];
    _pages = [
      Skills(),
      About(),
    ];
    _controller = TabController(
      length: _tabs.length,
      vsync: this,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _controller,
            tabs: _tabs,
            labelColor: Theme.of(context).colorScheme.secondary,
            indicatorColor: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

//===================
// Build Skills Tab
//===================
class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                '${DemoLocalizations.of(context).getTranslatedValues("fous")}',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: 180,
            child: GFButton(
              onPressed: () {
                _launchUrl('https://cutt.ly/bNXEEea');
              },
              text: "Telegram",
              icon: const Icon(Icons.telegram),
              type: GFButtonType.solid,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 180,
            child: GFButton(
              onPressed: () {
                // _launchUrl('https://cutt.ly/bNXEEea');
              },
              text: "Facebook",
              icon: const Icon(Icons.facebook),
              type: GFButtonType.solid,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                '${DemoLocalizations.of(context).getTranslatedValues("shere")}',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: 180,
            child: GFButton(
              onPressed: () {
                Share.share('https://t.me/CoursesForY0u/',
                    subject:
                        'Download Courses For You every thing in your hand');
              },
              text: "Shere",
              icon: const Icon(Icons.share),
              type: GFButtonType.solid,
              color: Colors.green,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

//==============================================================================

//===================
// Build About Tab
//===================
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Text('Courses Fou You',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
          Container(
            width: 180,
            height: 2,
            color: Colors.blue,
          ),
          const SizedBox(height: 5),
          Text(
              '${DemoLocalizations.of(context).getTranslatedValues("DescCourse")}',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

//==============================================================================
Future<void> _launchUrl(String _url) async {
  final url = Uri.parse("$_url");
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

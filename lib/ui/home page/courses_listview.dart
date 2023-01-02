import 'package:courses/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../flutter localizations/demoLocalizations.dart';
import '../../network/api.dart';
import '../details page/course_details.dart';
import 'constants.dart';

class CoursesListView extends StatefulWidget {
  CoursesListView({Key? key, required this.selectedCategory}) : super(key: key);
  String selectedCategory;

  @override
  State<CoursesListView> createState() => _CoursesListViewState();
}

class _CoursesListViewState extends State<CoursesListView> {
  //  getCourse(String? link) async {
  //   final url = Uri.parse("$link");
  //   await launchUrl(url,mode: LaunchMode.externalApplication);
  // }

  Future<APIModel>? all;
  Future<APIModel>? development;
  Future<APIModel>? iT;
  Future<APIModel>? design;
  Future<APIModel>? marketing;
  Future<APIModel>? business;
  Future<APIModel>? finance;
  Future<APIModel>? office;
  Future<APIModel>? personal;
  Future<APIModel>? lifestyle;
  Future<APIModel>? photography;
  Future<APIModel>? health;
  Future<APIModel>? music;
  Future<APIModel>? teaching;



  @override
  void initState() {
    super.initState();
    all = API().fetch('All');
    development = API().fetch('development');
    iT = API().fetch('it');
    design = API().fetch('design');
    marketing = API().fetch('marketing');
    business = API().fetch('business');
    finance = API().fetch('finance');
    office = API().fetch('office');
    personal = API().fetch('personal');
    lifestyle = API().fetch('lifestyle');
    photography = API().fetch('photography');
    health = API().fetch('health');
    music = API().fetch('music');
    teaching = API().fetch('teaching');

  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future:
        (widget.selectedCategory == 'All')
            ? all
        :(widget.selectedCategory == 'Development')
            ? development
            : (widget.selectedCategory == 'IT & Software')
                ? iT
                : (widget.selectedCategory == 'Design')
                    ? design
                    : (widget.selectedCategory == 'Marketing')
                        ? marketing
                        : (widget.selectedCategory == 'Business')
                            ? business
                            : (widget.selectedCategory ==
                                    'Finance & Accounting')
                                ? finance
                                : (widget.selectedCategory ==
                                        'Office Productivity')
                                    ? office
                                    : (widget.selectedCategory ==
                                            'Personal Development')
                                        ? personal
                                        : (widget.selectedCategory ==
                                                'Lifestyle')
                                            ? lifestyle
                                            : (widget.selectedCategory ==
                                                    'Teaching & Academics')
                                                ? photography
                                                : (widget.selectedCategory ==
                                                        'Health & Fitness')
                                                    ? health
                                                    : (widget.selectedCategory ==
                                                            'Music')
                                                        ? music
                                                        : (widget.selectedCategory ==
                                                                'Teaching & Academics')
                                                            ? teaching
                                                            : null,
        builder: (context, snapshot) {
          print('====================  ${widget.selectedCategory}');
          if (snapshot.hasData) {
            // var snapshot = s.data!.categories!.development!;
            // var snapshot2 = s.data!.categories!.development!;

            // x(){
            //   setState(() {
            //     if (selectedCategory[0] == 'Development') {
            //       snapshot = s.data!.categories!.development!;
            //       print(snapshot[0].name);
            //     } else if (selectedCategory[0] == 'IT & Software') {
            //       snapshot = s.data!.categories!.iTSoftware!;
            //       print(snapshot[0].name);
            //     } else if (selectedCategory[0] == 'Design') {
            //       snapshot = s.data!.categories!.design!;
            //       print(snapshot[0].name);
            //     }
            //   });
            // }
            if(snapshot.data!.results!.isEmpty){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Image.asset('images/5.png'),
                      width: 200,
                    ),
                  ),
                  Text('${DemoLocalizations.of(context).getTranslatedValues("NotFound")}',
                      style: TextStyle(fontSize: 22,color: Color(0xFF7679E7))
                  ),
                ],
              );
            }else{
            return Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kCardColor,
                          boxShadow: const [],
                        ),
                        height: height * 0.15,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '${snapshot.data!.results![index].imageUrl}',
                                    // '${s.data!.categories!.development![index].name}',
                                    height: height * 0.095,
                                  )),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: GradientText(
                                    '${snapshot.data!.results![index].name}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    gradient: kGradint,
                                  ),

                                  // Text(
                                  //   '${snapshot.data!.results![index].name}',
                                  //   style:  TextStyle(
                                  //       fontWeight: FontWeight.w800,
                                  //     color: Colors.cyan,
                                  //     // kAppbarColor,
                                  //   ),
                                  // ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kButtonsColor_2,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CourseDetails(
                                                name:
                                                    '${snapshot.data!.results![index].name}',
                                                imageUrl:
                                                    '${snapshot.data!.results![index].imageUrl}',
                                                description:
                                                    '${snapshot.data!.results![index].description}',
                                                category:
                                                    '${snapshot.data!.results![index].category}',
                                                language:
                                                    '${snapshot.data!.results![index].language}',
                                                time:
                                                    '${snapshot.data!.results![index].time}',
                                                timeExpired:
                                                    '${snapshot.data!.results![index].timeExpired}',
                                                usesRemaining:
                                                    '${snapshot.data!.results![index].usesReamaining}',
                                                isFree: snapshot.data!
                                                    .results![index].isfree!,
                                                learn:
                                                    '${snapshot.data!.results![index].learn}',
                                                url:
                                                    '${snapshot.data!.results![index].url}',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          '${DemoLocalizations.of(context).getTranslatedValues("moreInfo")}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    SizedBox(
                                      height: 24,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: kGradint,
                                          borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0
                                          ),
                                          onPressed: () async {
                                            final url = Uri.parse(
                                                "${snapshot.data!.results![index].url}");
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          },
                                          child: Text(
                                            '${DemoLocalizations.of(context).getTranslatedValues("getCourse")}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );}
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

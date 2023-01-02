import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../flutter localizations/demoLocalizations.dart';
import '../../model/api_model.dart';
import '../../network/api.dart';
import '../details page/course_details.dart';
import '../home page/constants.dart';


class FreeCoursesPage extends StatefulWidget {
  const FreeCoursesPage({Key? key}) : super(key: key);

  @override
  State<FreeCoursesPage> createState() => _FreeCoursesPageState();
}

class _FreeCoursesPageState extends State<FreeCoursesPage> {
  Future<APIModel>? freeCourses;

  @override
  void initState() {
    super.initState();
    freeCourses = API().fetch('free');
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
     body: FutureBuilder(
          future: freeCourses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data!.results!.isEmpty){
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: Image.asset('images/5.png'),
                      ),
                    ),
                    Text('${DemoLocalizations.of(context).getTranslatedValues("NotFound")}',
                        style: const TextStyle(fontSize: 22,color: Color(0xFF7679E7))
                    ),
                  ],
                );
              }else{
                return ListView.builder(
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
                                                      'null',
                                                      usesRemaining:
                                                      '999',
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
                    });}
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
//      body: FutureBuilder(
//           future: freeCourses,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               if(snapshot.data!.results!.isEmpty){
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: 200,
//                         child: Image.asset('images/5.png'),
//                       ),
//                     ),
//                     Text('${DemoLocalizations.of(context).getTranslatedValues("NotFound")}',
//                         style: const TextStyle(fontSize: 22,color: Color(0xFF7679E7))
//                     ),
//                   ],
//                 );
//               }else{
//                 return ListView.builder(
//                     itemCount: snapshot.data!.results!.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: kCardColor,
//                             boxShadow: const [],
//                           ),
//                           height: height * 0.15,
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.network(
//                                       '${snapshot.data!.results![index].imageUrl}',
//                                       // '${s.data!.categories!.development![index].name}',
//                                       height: height * 0.095,
//                                     )),
//                               ),
//                               const SizedBox(
//                                 width: 12,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SizedBox(
//                                     width: 200,
//                                     child: GradientText(
//                                       '${snapshot.data!.results![index].name}',
//                                       style: const TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold),
//                                       gradient: kGradint,
//                                     ),
//
//                                     // Text(
//                                     //   '${snapshot.data!.results![index].name}',
//                                     //   style:  TextStyle(
//                                     //       fontWeight: FontWeight.w800,
//                                     //     color: Colors.cyan,
//                                     //     // kAppbarColor,
//                                     //   ),
//                                     // ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       SizedBox(
//                                         height: 24,
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: kButtonsColor_2,
//                                           ),
//                                           onPressed: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     CourseDetails(
//                                                       name:
//                                                       '${snapshot.data!.results![index].name}',
//                                                       imageUrl:
//                                                       '${snapshot.data!.results![index].imageUrl}',
//                                                       description:
//                                                       '${snapshot.data!.results![index].description}',
//                                                       category:
//                                                       '${snapshot.data!.results![index].category}',
//                                                       language:
//                                                       '${snapshot.data!.results![index].language}',
//                                                       time:
//                                                       '${snapshot.data!.results![index].time}',
//                                                       timeExpired:
//                                                       '${snapshot.data!.results![index].timeExpired}',
//                                                       usesRemaining:
//                                                       '${snapshot.data!.results![index].usesReamaining}',
//                                                       isFree: snapshot.data!
//                                                           .results![index].isfree!,
//                                                       learn:
//                                                       '${snapshot.data!.results![index].learn}',
//                                                       url:
//                                                       '${snapshot.data!.results![index].url}',
//                                                     ),
//                                               ),
//                                             );
//                                           },
//                                           child: Text(
//                                             '${DemoLocalizations.of(context).getTranslatedValues("moreInfo")}',
//                                             style: const TextStyle(
//                                                 color: Colors.black),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 12,
//                                       ),
//                                       SizedBox(
//                                         height: 24,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               gradient: kGradint,
//                                               borderRadius: BorderRadius.circular(6)
//                                           ),
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Colors.transparent,
//                                                 elevation: 0
//                                             ),
//                                             onPressed: () async {
//                                               final url = Uri.parse(
//                                                   "${snapshot.data!.results![index].url}");
//                                               await launchUrl(url,
//                                                   mode: LaunchMode
//                                                       .externalApplication);
//                                             },
//                                             child: Text(
//                                               '${DemoLocalizations.of(context).getTranslatedValues("getCourse")}',
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     });}
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             return const Center(child: CircularProgressIndicator());
//           }),
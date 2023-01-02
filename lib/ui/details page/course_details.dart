import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter localizations/demoLocalizations.dart';
import '../home page/constants.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.language,
    required this.time,
    required this.timeExpired,
    required this.usesRemaining,
    required this.isFree,
    required this.learn,
    required this.url
  });

  final String name;
 final bool isFree;
  //String type;
  final String imageUrl;
  final String description;
  final String category;
  final String language;
  final String learn;
  final String timeExpired;
  //String discountPercent;
  final String usesRemaining;
  final String time;
  final String url;


  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    // DefaultAssetBundle.of(context).loadString('images/udemy2.json');
    // var showData =  json.decode(snapshot.data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          '${widget.category}',
          style: const TextStyle(fontSize: 18),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: kAppbarColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: kGradint,
            // gradient: LinearGradient(
            //     colors: [kAppbarColor, Colors.red],
            //     begin: Alignment.bottomCenter,
            //     end: Alignment.topCenter),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        width: 170,
        child:
        Container(
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
                final url = Uri.parse("${widget.url}");
                await launchUrl(url,mode: LaunchMode.externalApplication);
              },
            child: Text(
              '${DemoLocalizations.of(context).getTranslatedValues("getCourse")}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: kButtonsColor_1,
        //   ),
        //   onPressed: () async {
        //     final url = Uri.parse("${widget.url}");
        //     await launchUrl(url,mode: LaunchMode.externalApplication);
        //   },
        //   child: const Text(
        //     'Get Course',
        //     style: TextStyle(color: Colors.white, fontSize: 22),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(widget.imageUrl)),
            ),
            // Image.asset(widget.imageUrl),
            Container(
              decoration: BoxDecoration(
                  color: kCardColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 8),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                         TextSpan(
                          text: '${DemoLocalizations.of(context).getTranslatedValues("LastUpdate")}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.time}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      circle(widget.language, '${DemoLocalizations.of(context).getTranslatedValues("lang")}'),
                      circle(widget.timeExpired, '${DemoLocalizations.of(context).getTranslatedValues("ExpiredIn")}'),
                      circle(widget.usesRemaining, '${DemoLocalizations.of(context).getTranslatedValues("UsesRemaining")}'),
                      circle('100%', '${DemoLocalizations.of(context).getTranslatedValues("Discount")}'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                   Text(
                    '${DemoLocalizations.of(context).getTranslatedValues("WillLearn")}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 6, 10),
                    child: Text('${widget.learn}',style: TextStyle(fontSize: 16),),
                  ),
                  // const SizedBox(
                  //   height: 100,
                  // ),
                  // Center(
                  //   child: SizedBox(
                  //     height: 40,
                  //     width: 170,
                  //     child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: kButtonsColor_1,
                  //       ),
                  //       onPressed: widget.getCourse,
                  //       child: const Text(
                  //         'Get Course',
                  //         style: TextStyle(color: Colors.white, fontSize: 22),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget circle(
  String inside,
  String outside,
) {
  return SizedBox(
    height: 100,
    width: 95,
    child: Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundColor: kAppbarColor,
            child: Text(
              '$inside',
              style: const TextStyle(fontSize: 16,color: Colors.white),
            ),
          ),
        ),
        Text(
          '$outside',
          style: const TextStyle(fontSize: 13),
        )
      ],
    ),
  );
}

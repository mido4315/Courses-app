import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../home page/constants.dart';
class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

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
      body: Column(
       children: [],

      )
    );
  }
}

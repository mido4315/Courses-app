import 'package:flutter/material.dart';
import '../../flutter localizations/demoLocalizations.dart';
import 'constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController courseName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
          key: formKey,
          child: Center(
            child: SizedBox(
              height: height * 0.08,
              width: width - 40,
              child: TextFormField(
                controller: courseName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                        }
                      },
                      icon: const Icon(
                        Icons.search,
                      )),
                  fillColor: kCardColor,
                  filled: true,
                  hintText: '${DemoLocalizations.of(context).getTranslatedValues(
                      "search")}',
                  contentPadding: const EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

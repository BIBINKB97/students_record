import 'package:flutter/material.dart';
import 'package:student_records/database/db.dart';
import 'package:student_records/utils/colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.white,
    size: 25,
  );
  Widget customSearchBar = const Text(
    "All Students",
  );
  @override
  Widget build(BuildContext context) {
    return AppBar(
       
        centerTitle: true,
        title: customSearchBar,
        backgroundColor: ktheme,
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = Icon(
                    Icons.cancel,
                    color: Colors.white,
                  );
                  customSearchBar = TextField(
                    onChanged: (value) {
                      search(value);
                    },
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      fillColor: kwhite,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Search',
                    ),
                    style: TextStyle(
                      color: kblack,
                      fontSize: 18,
                    ),
                  );
                } else {
                  customIcon = Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  );
                  customSearchBar = Text(
                    "All Students",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                }
              });
            },
            child: SizedBox(
              width: 100,
              child: customIcon,
            ),
          ),
        ],
    
    );
  }
}
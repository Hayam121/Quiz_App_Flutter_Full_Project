import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/studentProviders/studentProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/profileSection/getProfileInfo.dart';
import '../../reusableWidgets/profileSection/provider.dart';
import '../quizOfEachTeacher/quizFromEachFaculty.dart';

Widget cardWidget(validData, index, type) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Consumer2<StudentProvider, ProfilePageProvider>(
      builder: (context, studentProvider, profileProvider, child) {
        return InkWell(
          child: Card(
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Create Column Widget of faculty Data to show in card........
                // These containers are defined below..........................
                type == "Grid"
                    ? Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              facultyNameContainer(
                                  validData?[index]["name"], context),
                              headingContainer("About Faculty", context),
                              contentContainer(
                                  validData?[index]["about"], context),
                              headingContainer(
                                  "Experience of Faculty", context),
                              contentContainer(
                                  validData?[index]["experience"], context),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          facultyNameContainer(
                              validData?[index]["name"], context),
                          headingContainer("About Faculty", context),
                          contentContainer(validData?[index]["about"], context),
                          headingContainer("Experience of Faculty", context),
                          contentContainer(
                              validData?[index]["experience"], context),
                        ],
                      ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 1.5,
                      width: screenWidth(context) / 1.2,
                      color: Colors.black,
                    ),
                    Container(
                      //color: Colors.green,
                      margin: const EdgeInsets.only(bottom: 15, top: 5),
                      child: Text(
                        "Tap to View",
                        style: TextStyle(
                            fontSize: 20,
                            color: hexToColor("#6D3233"),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () async {
            await getProfileInfo(profileProvider);
            studentProvider.setFacultyEmail(validData?[index].id);
            studentProvider.setFacultyName(validData?[index]["name"]);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const QuizFromEachFaculty()),
            );
          },
        );
      },
    ),
  );
}

// Container for faculty Name from snapshots.............................
Container facultyNameContainer(value, context) {
  return Container(
    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
    child: Text(value,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: setSize(context, 23),
            fontWeight: FontWeight.w800,
            color: hexToColor("#7520a1"),
            overflow: TextOverflow.visible)),
  );
}

// Container of Heading.............................
Container headingContainer(value, context) {
  return Container(
    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
    child: Text(value,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: setSize(context, 17),
            color: hexToColor("#14735b"),
            fontWeight: FontWeight.w800,
            overflow: TextOverflow.visible)),
  );
}

// Container of Data from snapshots............................
Container contentContainer(value, context) {
  return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
      child: Text(value,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: setSize(context, 15), fontWeight: FontWeight.w600)));
}

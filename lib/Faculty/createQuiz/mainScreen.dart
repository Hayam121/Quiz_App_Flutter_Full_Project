import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/createQuizProvider.dart';
import '../../reusableWidgets/Responsive.dart';
import '../../reusableWidgets/appBar.dart';
import '../../reusableWidgets/topBar/topBarFaculty.dart';
import 'listView.dart';
import 'submitQuizButton.dart';
import 'textFieldWidgets.dart';
import 'toggleButtonForDifficultyLevel.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  late CreateQuizProvider _createQuizProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _createQuizProvider =
          Provider.of<CreateQuizProvider>(context, listen: false);
    });
  }

  @override
  void dispose() {
    _createQuizProvider.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isLargeScreen(context)
          ? PreferredSize(
              preferredSize: Size(screenWidth(context), 70),
              child: const TopBarFaculty())
          : appBarCreate(context, "Create Quiz"),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Consumer<CreateQuizProvider>(
            builder: (context, providerValue, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: SizedBox(
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? screenWidth(context)
                            : screenWidth(context) / 2,
                        child: Column(
                          children: [
                            textFieldTitle(providerValue),
                            textFieldDescription(providerValue),
                            toggleButtonForDifficultyLevel(context),
                          ],
                        ),
                      ),
                    ),
                    listViewQuestions(context, providerValue),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: submitQuizButton(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/createQuizProvider.dart';
import '../../reusableWidgets/Responsive.dart';

// Submit Quiz Button Main Screen
Widget submitQuizButton() {
  return Consumer<CreateQuizProvider>(
    builder: (context, providerValue, child) {
      return ElevatedButton(
        child: Text(
            "Submit Quiz",
            style: TextStyle(fontSize: setSize(context, 16)),
          ),
          onPressed: () async {
            String? email = FirebaseAuth.instance.currentUser?.email.toString();

            int getDocsCount = await FirebaseFirestore.instance
                .collection("users")
                .doc(email)
                .collection("questions")
                .get()
                .then((value) => value.size);
            int i = 0;
            int a = 101;

            if (providerValue.list.isNotEmpty &&
                providerValue.quizTitle != "" &&
                providerValue.quizDesc != "") {
             
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(email)
                  .collection("questions")
                  .doc("${a + getDocsCount}")
                  .set({
                "Quiz Title": providerValue.quizTitle,
                "Quiz Description": providerValue.quizDesc,
                "Total Questions": providerValue.list.length,
                "Difficulty": providerValue.stringForQuizDifficulty
              });


              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(email)
                  .update({
                "attempt": getDocsCount+1,
              });

              for (var element in providerValue.list) {
                i++;
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(email)
                    .collection("questions")
                    .doc("${a + getDocsCount}")
                    .collection("${a + getDocsCount}")
                    .doc("$i")
                    .set(element);
              }

              providerValue.clearProviderValue();
              Navigator.pop(context);
            }
          },
        );
    },
  );
}

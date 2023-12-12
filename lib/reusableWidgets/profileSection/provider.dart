import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProfilePageProvider extends ChangeNotifier {
  String userName = "";
  String userPhone = "";
  String experience = "";
  String about = "";
  String qualification = "";
  String userType = "";
  String? imageUrl = '';

  getExperience(value) {
    experience = value;
    notifyListeners();
  }

  getAbout(value) {
    about = value;
    notifyListeners();
  }

  getQualification(value) {
    qualification = value;
    notifyListeners();
  }

  getUserType(value) {
    userType = value;
    notifyListeners();
  }

  getUserPhone(value) {
    userPhone = value;
    notifyListeners();
  }

  getUserName(value) {
    userName = value;
    notifyListeners();
  }

  getUserImage(value) {
    imageUrl = value;
    notifyListeners();
  }

  clearAllProfileData() {
    userName = "";
    userPhone = "";
    experience = "";
    about = "";
    qualification = "";
    userType = "";
    imageUrl = '';
    notifyListeners();
  }

  void getUserData() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email.toString())
        .get()
        .then(
      (value) {
        userName = (value.data()?["name"] == null) ? "" : value.data()?["name"];
        userPhone =
            (value.data()!["phone"] == null) ? "" : value.data()!["phone"];
        experience = (value.data()!["experience"] == null)
            ? ""
            : value.data()!["experience"];
        about = (value.data()!["about"] == null) ? "" : value.data()!["about"];
        qualification = (value.data()!["qualification"] == null)
            ? ""
            : value.data()!["qualification"];
        userType = (value.data()!["userType"] == null)
            ? ""
            : value.data()!["userType"];
        imageUrl =
            (value.data()!["image"] == null) ? "" : value.data()!["image"];
        notifyListeners();
      },
    );
  }

  void uploadImage(File value) {
    // upload image in firebase storage
    FirebaseStorage.instance
        .ref()
        .child("userImages")
        .child(FirebaseAuth.instance.currentUser!.email.toString())
        .putFile(value)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        imageUrl = value;
        print("📍image url: $value");
        notifyListeners();
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.email.toString())
            .update({
          "image": value,
        }).then((value) {
          print("📍image url updated in firestore");
          notifyListeners();
        });
      });
    });
  }
}

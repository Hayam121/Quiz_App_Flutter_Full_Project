import 'package:flutter/material.dart';
import 'package:flutter_project/constants/helper.dart';
import 'package:flutter_project/reusableWidgets/profileSection/provider.dart';
import 'package:image_picker/image_picker.dart';

Widget userImageContent(context, ProfilePageProvider providerValue) {
  return Stack(
    children: [
      ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image:
                providerValue.imageUrl == null || providerValue.imageUrl == ''
                    ? const AssetImage("assets/images/user_img.png")
                    : NetworkImage(providerValue.imageUrl!) as ImageProvider,
            width: 100.0,
            height: 100.0,
            child: InkWell(onTap: () {
              Helper.getImage(imageSource: ImageSource.gallery).then((value) {
                providerValue.uploadImage(value);
              });
            }),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 4,
        child: buildEditIcon(),
      ),
    ],
  );
}

Widget buildEditIcon() => buildCircle(
      color: Colors.white,
      all: 2,
      child: buildCircle(
        color: Colors.blue,
        all: 5,
        child: const Icon(
          Icons.edit,
          color: Colors.black,
          size: 18,
        ),
      ),
    );

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );

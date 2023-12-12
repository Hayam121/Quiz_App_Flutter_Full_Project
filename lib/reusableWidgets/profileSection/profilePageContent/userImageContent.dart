import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Responsive.dart';






// import 'dart:io';
// import 'package:path/path.dart' as p;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_downloader/image_downloader.dart';



// class _MyAppState extends State<MyApp> {
//   File? _image;
//   String? _url;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: _image == null ? null : FileImage(_image!),
//                   radius: 80,
//                 ),
//                 GestureDetector(onTap: pickImage, child: Icon(Icons.camera_alt))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Builder(
//                   builder: (context) => ElevatedButton(
//                     onPressed: () {
//                       uploadImage(context);
//                     },
//                     child: Text('Upload Image'),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: loadImage,
//                   child:const Text('Load Image'),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void pickImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//   }

//   void uploadImage(context) async {
//     try {
//       FirebaseStorage storage =
//           FirebaseStorage(storageBucket: 'gs://test-193e1.appspot.com');
//       StorageReference ref = storage.ref().child(_image.path);
//       StorageUploadTask storageUploadTask = ref.putFile(_image);
//       StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text('success'),
//       ));
//       String url = await taskSnapshot.ref.getDownloadURL();
//       print('url $url');
//       setState(() {
//         _url = url;
//       });
//     } catch (ex) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text(ex.message),
//       ));
//     }
//   }

//   void loadImage() async {
//     var imageId = await ImageDownloader.downloadImage(_url!);
//     var path = await ImageDownloader.findPath(imageId!);
//     File image = File(path!);
//     setState(() {
//       _image = image;
//     });
//   }
// }






// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_downloader/image_downloader.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   XFile? _image;
//   String? _url;

//   @override
//   void initState() {
//     super.initState();
//     _image = XFile('');
//     _url = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             userImageContent(context),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: _image!.path.isEmpty ? null : FileImage(_image as File),
//                   radius: 80,
//                 ),
//                 GestureDetector(onTap: pickImage, child: const Icon(Icons.camera_alt))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Builder(
//                   builder: (context) => ElevatedButton(
//                     onPressed: () {
//                       uploadImage(context);
//                     },
//                     child:const Text('Upload Image'),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: loadImage,
//                   child: const Text('Load Image'),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget userImageContent(BuildContext context) {
//     String? imageUrl = FirebaseAuth.instance.currentUser?.photoURL?.toString();
//     if (imageUrl == null || imageUrl == "null") {
//       return Container(
//         margin: EdgeInsets.only(
//           top: setSize(context, 40),
//           bottom: setSize(context, 7),
//         ),
//         child: Image.asset(
//           "assets/images/user_img.png",
//           height: 100,
//           width: 100,
//         ),
//       );
//     } else {
//       return Container(
//         margin: EdgeInsets.only(
//           top: setSize(context, 40),
//           bottom: setSize(context, 7),
//         ),
//         child: Image.network(
//           imageUrl,
//           height: 100,
//           width: 100,
//         ),
//       );
//     }
//   }

//   double setSize(BuildContext context, double value) {
//     // Replace this function with your actual sizing logic
//     // if it's supposed to be dynamic.
//     return value;
//   }

//   void pickImage() async {
//     final imagePicker = ImagePicker();
//     XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

//     //var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         _image = image;
//       });
//     }
//   }

//   void uploadImage(BuildContext context) async {
//     try {
//       FirebaseStorage storage =
//           FirebaseStorage.instanceFor(bucket: 'gs://test-193e1.appspot.com');
//       var ref = storage.ref().child(_image!.path);
//       var storageUploadTask = ref.putFile(_image as File );
//       var taskSnapshot = await storageUploadTask;
//       ScaffoldMessenger.of(context).showSnackBar(
  
//     SnackBar(
//       content: Text('Success'),
//     ),
//     );
//       String url = await taskSnapshot.ref.getDownloadURL();
//       print('URL $url');
//       setState(() {
//         _url = url;
//       });
//     } catch (ex) {
//       ScaffoldMessenger.of(context).showSnackBar(
//   SnackBar(
//     content: Text(ex.toString()),
//   ),
// );

//     }
//   }

//   void loadImage() async {
//     if (_url!.isNotEmpty) {
//       var imageId = await ImageDownloader.downloadImage(_url!);
//       var path = await ImageDownloader.findPath(imageId!);
//       if (path != null) {
//         File image = File(path);
//         setState(() {
//           _image = image as XFile?;
//         });
//       }
//     }
//   }
// }









// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_downloader/image_downloader.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   XFile? _image;
//   String? _url;

//   @override
//   void initState() {
//     super.initState();
//     _image = XFile('');
//     _url = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             userImageContent(context),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: _image!.path.isEmpty ? null : FileImage(_image as File),
//                   radius: 80,
//                 ),
//                 GestureDetector(onTap: pickImage, child: const Icon(Icons.camera_alt))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Builder(
//                   builder: (context) => ElevatedButton(
//                     onPressed: () {
//                       uploadImage(context);
//                     },
//                     child:const Text('Upload Image'),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: loadImage,
//                   child: const Text('Load Image'),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget userImageContent(BuildContext context) {
//     String? imageUrl = FirebaseAuth.instance.currentUser?.photoURL?.toString();
//     if (imageUrl == null || imageUrl == "null") {
//       return InkWell(
//         onTap: () {
//           pickImage();
//         },
//         child: Container(
//           margin: EdgeInsets.only(
//             top: setSize(context, 40),
//             bottom: setSize(context, 7),
//           ),
//           child: Image.asset(
//             "assets/images/user_img.png",
//             height: 100,
//             width: 100,
//           ),
//         ),
//       );
//     } else {
//       return InkWell(
//         onTap: () {
//           pickImage();
//         },
//         child: Container(
//           margin: EdgeInsets.only(
//             top: setSize(context, 40),
//             bottom: setSize(context, 7),
//           ),
//           child: Image.network(
//             imageUrl,
//             height: 100,
//             width: 100,
//           ),
//         ),
//       );
//     }
//   }

//   double setSize(BuildContext context, double value) {
//     // Replace this function with your actual sizing logic
//     // if it's supposed to be dynamic.
//     return value;
//   }

//   void pickImage() async {
//     final imagePicker = ImagePicker();
//     XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         _image = image;
//       });
//     }
//   }

//   void uploadImage(BuildContext context) async {
//     try {
//       FirebaseStorage storage =
//           FirebaseStorage.instanceFor(bucket: 'gs://test-193e1.appspot.com');
//       var ref = storage.ref().child(_image!.path);
//       var storageUploadTask = ref.putFile(_image as File );
//       var taskSnapshot = await storageUploadTask;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Success'),
//         ),
//       );
//       String url = await taskSnapshot.ref.getDownloadURL();
//       print('URL $url');
//       setState(() {
//         _url = url;
//       });
//     } catch (ex) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(ex.toString()),
//         ),
//       );
//     }
//   }

//   void loadImage() async {
//     if (_url!.isNotEmpty) {
//       var imageId = await ImageDownloader.downloadImage(_url!);
//       var path = await ImageDownloader.findPath(imageId!);
//       if (path != null) {
//         File image = File(path);
//         setState(() {
//           _image = image as XFile?;
//         });
//       }
//     }
//   }
// }



import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:firebase_auth/firebase_auth.dart';




// // Container for user Image
// Container userImageContent(context) {
//   String? imageUrl = FirebaseAuth.instance.currentUser?.photoURL.toString();
//   if (imageUrl == "null") {
//     return Container(
//       margin: EdgeInsets.only(
//           top: setSize(context, 40), bottom: setSize(context, 7)),
//       child: Image.asset(
//         "assets/images/user_img.png",
//         height: 100,
//         width: 100,
//       ),
      
//     );
    
//   } else {
//     return Container(
//       margin: EdgeInsets.only(
//           top: setSize(context, 40), bottom: setSize(context, 7)),
//       child: Image.network(
//         imageUrl!,
//         height: 100,
//         width: 100,
//       ),
//     );
//   }
// }



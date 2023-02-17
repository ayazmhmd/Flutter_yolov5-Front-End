// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// class Display extends StatefulWidget {
//   final File image;
//   const Display({Key? key, required this.image}) : super(key: key);
//
//   @override
//   State<Display> createState() => _DisplayState();
// }
//
// class _DisplayState extends State<Display> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children:[
//           Container(
//             height: MediaQuery.of(context).size.height*0.5,
//             width: MediaQuery.of(context).size.width*0.7,
//             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15),
//             alignment: Alignment.center,
//             child: Image.file(
//             image,
//             fit: BoxFit.cover,
//     ),
//           ),
//           // Positioned(
//           //     bottom: 60,
//           //     child: Visibility(
//           //       visible: model.predictions.isNotEmpty,
//           //       child: results(),
//           //     )),
//         ]
//     );
//   }
// }

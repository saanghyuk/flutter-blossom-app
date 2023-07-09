// import 'dart:async';
//
// import 'package:blossom/Components/iconsTextButton.dart';
// import 'package:blossom/Components/uploadBar.dart';
// import 'package:flutter/material.dart';
//
// class Upload extends StatelessWidget {
//   final String name;
//   // final FutureOr<void> Function()? image_cb;
//   // final FutureOr<void> Function()? video_cb;
//   // final FutureOr<void> Function()? item_cb;
//   final FutureOr<void> Function(int) iconsTextButtonCb;
//   final FutureOr<void> Function(String)? onSubmittedCb;
//
//   const Upload({Key? key, required this.name, required this.iconsTextButtonCb, this.onSubmittedCb}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 10.0, left:10.0),
//           child: Row(
//               children: [Text("Hi, ${this.name}", style: TextStyle(fontSize: 20.0),)],
//           ),
//         ),
//         Container(
//             margin: EdgeInsets.only(top: 10.0, left:10.0),
//             child:
//               TextField(
//                   onSubmitted: this.onSubmittedCb,
//                   decoration: InputDecoration(
//                   hintText: "Placeholder Placeholder",
//                   border: InputBorder.none,
//                 ),
//             )
//         ),
//         Container(
//           padding: EdgeInsets.all(10.0),
//           child: UploadBar(
//               children: [
//                 IconTextButton(
//                       text: 'Image',
//                       iconData: Icons.image,
//                   ),
//                 IconTextButton(
//                     text: 'Video',
//                     iconData: Icons.image,
//                 ),
//                 IconTextButton(
//                     text: 'Item',
//                     iconData: Icons.image,
//                 )
//               ],
//               onTap : (int index){
//                   iconsTextButtonCb(index);
//               }
//           )
//             // @TODO
//             // // Upload 생성자의 Children이 들어가도록 리팩토링
//             // UploadComponent(
//             //   children: List[icontextbutton 3개],
//             //   onTap: (int index){
//             //     if(index == 0){
//             //       cb(0);
//             //     }
//             //   }
//             // )
//             // @TODO
//             // 3단계 UploadComponent의 생성자 추가해서 Builder 사용
//           //   Row(
//           //   children: [
//           //     Expanded(
//           //       child: IconTextButton(
//           //           text: 'Image',
//           //           iconData: Icons.image,
//           //           cb: this.image_cb
//           //       )
//           //     ),
//           //     Expanded(
//           //       child: IconTextButton(
//           //           text: 'Video',
//           //           iconData: Icons.video_call_rounded,
//           //           cb: this.video_cb
//           //       ),
//           //     ),
//           //     Expanded(
//           //       child: IconTextButton(
//           //           text: 'Item',
//           //           iconData: Icons.shopping_bag,
//           //           cb: this.item_cb
//           //       )
//           //     ),
//           //   ],
//           // ),
//         ),
//
//       ],
//     );
//   }
// }

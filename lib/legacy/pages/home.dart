import 'package:blossom/legacy/Components/iconsTextButton.dart';
import 'package:flutter/material.dart';
import '../Components/uploadBar.dart';

class Home extends StatelessWidget {
  static const String path = "home";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if(index ==0 ){
                return UploadBar(
                  name: 'Sohpia',
                  items: [
                    IconTextButton(
                        text: "Image",
                        iconData: Icons.photo,
                        isActive: true,
                    ),
                    IconTextButton(
                        text: "Video",
                        iconData: Icons.video_camera_front,
                        isActive: true,
                    ),
                    IconTextButton(
                        text: "Shopping",
                        iconData: Icons.shopping_bag,
                        isActive: true,
                    )
                  ],
                  iconsTextButtonCb: (int index){
                    if(index ==0){
                      print("index 0 function called");
                    } else if(index ==1){
                      print("index 1 function called");
                    } else{
                      print("index 2 function called");
                    }
                  },
                  // TODO
                  // image or Video, Item, Text 중에 하나라도 올렸으면, 진짜 Submit버튼을 띄워야 한다.
                  // Boolean -> Next Button
                  onSubmittedCb : (String text){
                    print(text);
                  },
                );
              }
              return Container(
                margin: EdgeInsets.only(top:10.0),
                height: 30.0,
                color: Colors.red,
                child: Text("$index")
            );
            }
        )
    );
  }
}

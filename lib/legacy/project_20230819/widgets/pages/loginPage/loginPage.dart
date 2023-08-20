import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /// 키보드 누르면 줄어든다. 그걸 대비하는 것
        body: SafeArea(
          // ListView썼어도, SingleChild + Container을 쓴 것과 동일하다.
          child: SingleChildScrollView(
            child: Container(
              child:  Column(
                children: [
                  // 배경까지 가져와서 쓰는 코드
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: Container(
                      color: Colors.red
                    ),
                  ),
                  Text("plz..."),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    // 방지턱 여부 실험 체크
                    child: TextField(
                      minLines: 1,
                      maxLines: 1,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: "asdfasdf",
                        hintText: "Email",
                        // errorText는 null이 아니면 error가 나오는 것.
                        errorText: null,
                        counterText: "",
                        border: OutlineInputBorder(
                          // borderRadius: ,
                          // borderSide: BorderSide(),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: Colors.grey)
                    ),
                    // 방지턱 여부 실험 체크
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            /// 텍스트 필드 활성화
                            // onTap: ,
                            // onEditingComplete: (){}
                            // onSubmitted: (){}
                            obscureText: true,
                            minLines: 1,
                            maxLines: 1,
                            maxLength: 20,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "asdfasdf",
                              hintText: "PWD",
                              // errorText는 null이 아니면 error가 나오는 것.
                              errorText: null,
                              counterText: "",
                              // border: OutlineInputBorder(
                              //   // borderRadius: ,
                              //   // borderSide: BorderSide(),
                              // ),
                              contentPadding: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.remove_red_eye_rounded))
                      ],
                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text("f-pwd")), 
                  MaterialButton(onPressed: (){}, child: Text("Login")),
                  Container(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                        /// 위치를 제어해야 하면 Positioned
                        Positioned(
                            // left: 20.0,
                            child: Container(
                              color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.0
                              ),
                                child: Text("SNS LOGIN"))
                        )
                      ],
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(onPressed: (){}, child: Text("A"),
                        elevation: .2,
                      ),
                      FloatingActionButton(onPressed: (){}, child: Text("B"),
                        elevation: .2,),
                      FloatingActionButton(onPressed: (){}, child: Text("C"),
                        elevation: .2,),
                    ],
                  ),
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't................"),
                      TextButton(onPressed: (){}, child: Text("Sign Up"))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

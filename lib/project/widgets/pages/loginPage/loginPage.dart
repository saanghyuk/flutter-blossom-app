import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {

  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  // 키보드랑 깜빡이는거 제어할 수 있다.
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    this._emailController.dispose();
    this._pwdController.dispose();
    this._emailFocus.dispose();
    this._pwdFocus.dispose();
    super.dispose();
  }

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
                      controller: this._emailController,
                      focusNode: this._emailFocus,
                      /// 다음 TextField로
                      textInputAction: TextInputAction.next,
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
                            controller: this._pwdController,
                            focusNode: this._pwdFocus,
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
                  MaterialButton(onPressed: (){
                    /// 이걸 해야 키보드가 내려가는 것
                    /// 둘다 unfocus달아서 키보드는 무조건 내려가도록 해준 것.
                    this._emailFocus.unfocus();
                    this._pwdFocus.unfocus();
                  }, child: Text("Login")),
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
                        heroTag: [],
                      ),
                      FloatingActionButton(onPressed: (){}, child: Text("B"),
                        heroTag: [],
                        elevation: .2,),
                      FloatingActionButton(onPressed: (){}, child: Text("C"),
                        heroTag: [],
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

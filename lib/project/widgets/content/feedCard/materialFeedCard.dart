import 'package:flutter/material.dart'; 

class MaterialFeedCard extends StatelessWidget {
  const MaterialFeedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0, 1),
            )
          ]
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(),
                  SizedBox(width: 4.0),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Noelaafsdfasdfasdfasdfadsfadsafsadfasdfasdfasdafasdfas", overflow: TextOverflow.ellipsis,),
                            Text("SubTitle"),
                          ])
                  ),
                  SizedBox(width: 4.0),
                  IconButton(
                      onPressed: (){}, icon: Icon(Icons.more_vert)
                  )
                ],
              )
            ),
            Container(),
            Container(),
            Container(),
          ]
      ),
    );
  }
}

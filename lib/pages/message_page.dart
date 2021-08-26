import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("All activity", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),),
            Icon(Icons.arrow_drop_down, color: Colors.black,),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
              icon: SvgPicture.asset("assets/images/send.svg", color: Colors.black,
               height: 22.5,
              ),
          )
        ],
      ),
      body: Column(
        children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Text("Suggested acounts ", style: TextStyle(color: Colors.grey),),
              Icon(Icons.details, color: Colors.grey, size: 15,)
            ],
          ),
        ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/user_3.jpeg"),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Leonardo DiCaprio", style: TextStyle(color: Colors.black),),
                        SizedBox(height: 3,),
                        Text("From your contacts", style: TextStyle(color:  Colors.grey),),

                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                   MaterialButton(
                     elevation: 0,
                     height: 30,
                     onPressed: (){},
                     color: Colors.redAccent,
                     child: Text("Follow", style: TextStyle(color: Colors.white),),
                   ),
                    SizedBox(width: 7,),
                    Icon(Icons.cancel_outlined, color: Colors.grey,)
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

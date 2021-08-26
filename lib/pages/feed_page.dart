import 'package:flutter/material.dart';
import 'package:tiktok_ui/main.dart';

import 'home_page.dart';

class FeedPage extends StatefulWidget {
 //  const FeedPage({Key? key}) : super(key: key);
  static final String id = "feed_page";

   @override
   _FeedPageState createState() => _FeedPageState();
 }

 class _FeedPageState extends State<FeedPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Feed Page"),
             IconButton(onPressed: (){
               Navigator.pushReplacementNamed(context, HomePage.id);
             },
                 icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30,)
             )
           ],
         ),
       ),
     );
   }
 }

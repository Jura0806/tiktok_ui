import 'package:flutter/material.dart';
import 'package:tiktok_ui/pages/account_page.dart';
import 'package:tiktok_ui/pages/feed_page.dart';
import 'package:tiktok_ui/pages/home_page.dart';
import 'package:tiktok_ui/pages/message_page.dart';
import 'package:tiktok_ui/pages/search_page.dart';
import 'package:tiktok_ui/utils/BottomBar_icon.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok_UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        HomePage.id: (context) => MyHomePage(),
        FeedPage.id: (context) => FeedPage(),

      },
    );
  }
}

  class MyHomePage extends StatefulWidget {

   static final String id = "myHome_page" ;
    @override
    _MyHomePageState createState() => _MyHomePageState();
  }
  class _MyHomePageState extends State<MyHomePage>{

    int indexPage = 0;
    int helpNum =2;
    int number = 0;
   Widget build(BuildContext context){
  return Scaffold(
    body: getBody(),
    bottomNavigationBar: getBottomBar(),
  );
  }
  Widget getBottomBar(){
  return  Container(
     height: 85,
     decoration: BoxDecoration(
       border: Border(top: BorderSide(width: 1, color: Colors.grey.shade400)),
       color: indexPage ==0 ? Colors.black : Colors.white
     ),
     child: Padding(
       padding: const EdgeInsets.only(top: 3),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: List.generate(icons.length, ( index) {
       return index == 2 ? getFeed() : Column(
         children: [
           IconButton(onPressed: (){
             setState(() {
               indexPage = index;
             });
           },
               icon: SvgPicture.asset(
               indexPage == index ?
               icons[index]["active"].toString():
             icons[index]["inActive"].toString(),
             height: 25,
                   color: indexPage ==0 ? Colors.white : Colors.black
             ),
           ),
           Text(icons[index]["label"].toString(), style: TextStyle(
               color: indexPage ==0 ? Colors.white : Colors.black,
             fontSize: 10,
             fontWeight: indexPage == index ? FontWeight.bold : FontWeight.normal
           ),
           )
         ],
       );
    }
       ),
     ),
     )
   );
  }

   Widget getBody(){
   return IndexedStack(
     index: indexPage,
     children: [
       HomePage(),
       SearchPage(),
       FeedPage(),
       MessagePage(),
       AccountPage()
     ],
   );
   }

   Widget getFeed(){
     return GestureDetector(
       onTap: (){
       Navigator.pushNamed(context, FeedPage.id);
       },
       child: Container(
         padding: EdgeInsets.only(top: 15),
         child: Stack(
           children: [
             Container(
               margin: EdgeInsets.only(right: 10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 color: Colors.greenAccent,
               ),
               height: 27,
               width: 30,
             ),
             Container(
               margin: EdgeInsets.only(left: 10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 color: Colors.redAccent,
               ),
               height: 27,
               width: 30,
             ),
             Container(
               margin: EdgeInsets.only(left: 5),
               height: 27,
               width: 30,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                   color: indexPage ==0 ? Colors.white : Colors.black
               ),
               child: Icon(Icons.add, size: 20,  color: indexPage ==0 ? Colors.black : Colors.white ),
             )
           ],
         ),
       ),
     );
   }
  }



import 'package:flutter/material.dart';
import 'package:tiktok_ui/models/trendeing_model.dart';
import 'package:tiktok_ui/utils/trending_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // #Searching
          Row(
            children: [
              Container(
                height: 40,
                width: 350,
                margin: EdgeInsets.only(top: 45,left: 20),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(.25),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(Icons.search, color: Colors.black,),
                    border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 45, left: 10),child: Icon(Icons.qr_code_2, size: 30,))
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                // #Reklama
                Container(
                  height: 200,
                  width: double.infinity,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                     Container(
                       child: Image.asset("assets/images/story_5.jpeg", fit: BoxFit.cover,),
                     ),
                      Container(
                        child: Image.asset("assets/images/story_3.jpeg", fit: BoxFit.cover,),
                      ),
                    ],

                  ),
                ),
               SizedBox(height: 15,),
               //#trending posts
                  trendingPost(),
              ],
            ),
          )
        ],
      )
    );
  }
  Widget trendingPost(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 0.5,
                          color: Colors.grey
                      ),
                    ),
                    child: Icon(Icons.tag,color: Colors.black, size: 20,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fantasies", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text("Trending hashtag", style: TextStyle(color: Colors.grey, fontSize: 12),)
                    ],
                  ),
                ],
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.grey.withOpacity(.3),
                child: Center(child: Text("31.2M>", style: TextStyle(color: Colors.black, fontSize: 12.5),),),
              )
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: trendVideos.map((trend)  {
                return videos(trend);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
  
   Widget videos(TrendingPost trend){
    return Container(
      margin: EdgeInsets.only(right: 3),
      height: 150,
      width: 103,
      child: Image.asset(trend.videos, fit: BoxFit.cover,),
    );
}
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_ui/models/home_data.dart';
import 'package:tiktok_ui/models/upper_part_model.dart';
//import 'package:tiktok_ui/pages/user_profile.dart';


class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
   static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLiked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dataList.length,
              itemBuilder: (ctx, i){
                return itemPage(dataList[i]);
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 50,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){
                      },
                      child: Text("Following", style: TextStyle(
                        color: Colors.white70,
                        //fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                      ),
                  ),
                  SizedBox(width: 5,),
                  Text("|", style: TextStyle(color: Colors.white70),),
                  SizedBox(width: 5,),
                  TextButton(
                    onPressed: (){},
                    child: Text("For You", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );

  }
   Widget leftList(ActionModel data){
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
           height: 250,
           width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@${data.userName}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
              SizedBox(height: 10,),
               Text(data.userCaption, style: TextStyle(color: Colors.white),),
            ],
          ),
         ),
          SizedBox(height: 10,),
          Container(
            //color: Colors.black,
            height: 15,
            child: Row(
              children: [
                Container(width : 25, child: Icon(Icons.music_note,color: Colors.white,size: 20,)),
                Text(data.musicName, style: TextStyle(color: Colors.white),),
              ],
            ),
          )

        ],
    );
   }
   Widget usersAvatar(ActionModel data){
    return Container(
      height: 65,
      child: Stack(
        children: [
        Container(
         height: 55,
          width: 55,
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 1,
              color: Colors.white
          ),
        ),
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image(
              image: AssetImage(data.userAvatarImg),
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
      ),
        ),
          Positioned(
            top: 40,
            left: 15,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red
              ),
              child: Center(child: Icon(Icons.add, color: Colors.white, size: 17,)),
            ),
          ),

        ],
      ),
    );
   }
   Widget usersLike(ActionModel data){
    return Container(
      child: Column(
        children: [
         GestureDetector(
           onTap: (){
             // ignore: unnecessary_statements
             setState(() {
               isLiked = !isLiked ;
             });
           },
           child: SvgPicture.asset("assets/images/heart_active (1).svg",
             color: isLiked == true ? Colors.red.withOpacity(.7): Colors.white.withOpacity(.7),
             height: isLiked == true? 42 :  40,
           ),
         ),
          SizedBox(height: 3,),
          Text(data.likeCount, style: TextStyle(color: Colors.white, fontSize: 12.5),),
        ],
      ),
    );
   }
   Widget usersComments(ActionModel data){
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Icon(Icons.insert_comment_sharp, color: Colors.white, size: 40,),
          ),
          Text(data.commentCount, style: TextStyle(color: Colors.white, fontSize: 12.5),),
        ],
      ) ,
    );
   }
   Widget share(ActionModel data){
    return Container(
      child: Column(
        children: [
          IconButton(onPressed: (){},
              icon: SvgPicture.asset("assets/images/share (2).svg",
              color: Colors.white,),
            iconSize: 35,
          ),
          Text(data.shareCount, style: TextStyle(color: Colors.white, fontSize: 12.5),),
        ],
      ),
    );
   }
   Widget soundCircle(ActionModel data){
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 7,
          color: Colors.brown
        ),
      ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image(
          image: AssetImage(data.musicAvatarImg),
          height: 48,
          width: 48,
          fit: BoxFit.cover,
        ),
      ),
    );
   }
   Widget itemPage(ActionModel data){
    return  Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(data.backgroundVideo, fit: BoxFit.cover,),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, bottom: 20),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              leftList(data),
              Container(
                width: 70,
                height: 425,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    usersAvatar(data),
                    usersLike(data),
                    usersComments(data),
                    share(data),
                    SizedBox(height: 10,),
                    soundCircle(data),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ) ;
   }
}

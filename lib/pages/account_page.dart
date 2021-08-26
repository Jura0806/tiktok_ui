import 'package:flutter/material.dart';
import 'package:tiktok_ui/models/account_post_model.dart';
import 'package:tiktok_ui/utils/account_data.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with SingleTickerProviderStateMixin{
   late TabController tabController;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.person_add_alt, color: Colors.black87, size: 27,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("jurabekabduganiyev", style: TextStyle(color: Colors.black),),
            Icon(Icons.arrow_drop_down, color: Colors.black,),
          ],
        ),
        actions: [
          Icon(Icons.menu, color: Colors.black87,),
          SizedBox(width: 10,)
        ],
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Container(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  CircleAvatar(
                    radius: 45,
                   backgroundImage: AssetImage("assets/images/user_3.jpeg"),
                  ),
                  SizedBox(height: 20,),
                  Text("@jurabekabduganiye", style: TextStyle(color: Colors.black.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 17),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        Text("2", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                        SizedBox(height: 5,),
                        Text("Following", style: TextStyle(color: Colors.grey),),
                      ],),
                      SizedBox(width: 25,),
                      Text("|", style: TextStyle(color: Colors.grey.withOpacity(.3)),),
                      SizedBox(width: 25,),
                      Column(
                        children: [
                        Text("0", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                        SizedBox(height: 5,),
                        Text("Followers", style: TextStyle(color: Colors.grey),),
                      ],),
                      SizedBox(width: 25,),
                      Text("|", style: TextStyle(color: Colors.grey.withOpacity(.3)),),
                      SizedBox(width: 25,),
                      Column(children: [
                        Text("0", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                        SizedBox(height: 5,),
                        Text("Like", style: TextStyle(color: Colors.grey),),
                      ],),
                    ],
                  ),
                 SizedBox(height: 15,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     GestureDetector(
                       onTap: (){},
                         child: Container(
                           width: 150,
                             height: 45,
                             decoration: BoxDecoration(
                               border: Border.all(
                                 width: .4,
                                 color: Colors.grey
                               )
                             ),
                             child: Center(child: Text("Edit profile",style: TextStyle(color: Colors.black),))),
                     ),
                     SizedBox(width: 5,),
                     GestureDetector(
                       onTap: (){},
                       child: Container(
                           width: 45,
                           height: 45,
                           decoration: BoxDecoration(
                               border: Border.all(
                                   width: .4,
                                   color: Colors.grey
                               )
                           ),
                           child: Center(child: Icon(Icons.bookmark_border_outlined, color: Colors.black,))),
                     ),
                   ],
                 ),
                  SizedBox(height: 20,),
                  Text("Tap to add bio", style: TextStyle(color: Colors.black.withOpacity(.8)),),
                  SizedBox(height: 20,),
                  Divider(),
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      indicatorWeight: 2.0 ,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                    Tab(icon: Icon(Icons.bookmark, color: Colors.black,)),
                    Tab(icon: Icon(Icons.favorite_border_outlined, color: Colors.black,)),
                    Tab(icon: Icon(Icons.security_update_warning_sharp, color: Colors.black,)),
                  ]),
                 DefaultTabController(
                      length: 3,
                      child: Container(
                        height: 220 * postVideos.length / 3  ,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                          GridView.count(
                             crossAxisCount: 3,
                            childAspectRatio: .8,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0,
                            physics: NeverScrollableScrollPhysics(),
                            children: postVideos.map((post){
                              return  itemOfPost((post));
                            }).toList(),
                          ),
                            Center(
                              child: Text("page2"),
                            ),
                            Center(
                              child: Text("page3"),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
        ),
      ),

    );
  }
   Widget itemOfPost(PostBio post){
      return Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image(image: AssetImage(post.postVideo), fit: BoxFit.cover,)),
              Positioned(
                top: 150,
                child: Row(
                  children: [
                    Icon(Icons.play_arrow_outlined,color: Colors.white,),
                    Text(post.review, style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ],
          )
      );
   }
}




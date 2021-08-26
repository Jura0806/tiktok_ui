// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class PostVideo extends StatefulWidget {
//   const PostVideo({Key? key}) : super(key: key);
//
//   @override
//   _PostVideoState createState() => _PostVideoState();
// }
//
// class _PostVideoState extends State<PostVideo> {
//
//   late VideoPlayerController _controller;
//    late Future<void> _initilazeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // ignore: unnecessary_statements
//     _controller == VideoPlayerController.asset("assets/images/landscape.mp4");
//      _initilazeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//     _controller.setVolume(1.0);
//   }
//
//      @override
//   void dispose() {
//     // TODO: implement dispose
//        _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: _initilazeVideoPlayerFuture,
//        builder: (context, snapshot){
//          if(snapshot.connectionState == ConnectionState.done){
//            return AspectRatio(
//                aspectRatio: _controller.value.aspectRatio,
//              child: Stack(
//                children: [
//                  IconButton(
//                      onPressed: (){
//                        setState(() {
//                          if(_controller.value.isPlaying){
//                            _controller.pause();
//                          }else{
//                            _controller.play();
//                          }
//                        });
//                      },
//                      icon: Icon(_controller.value.isPlaying? Icons.pause : Icons.play_arrow),
//                  ),
//                  VideoPlayer(_controller),
//                ],
//              ),
//            );
//          }else{
//            return Center(child: CircularProgressIndicator());
//          }
//        }
//    );
//   }
// }

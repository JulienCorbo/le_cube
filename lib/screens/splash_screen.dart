
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:le_cube/screens/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState(){
    super.initState();

    _controller = VideoPlayerController.asset('assets/splashscreen.mp4',)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);
    _playVideo();
  }
  void _playVideo() async{
    _controller.play();

    await Future.delayed(const Duration(milliseconds: 5350));

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage()
    ));
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: Colors.blueAccent,
          height: double.infinity,
          child: _controller.value.isInitialized
              ?AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(
              _controller,
            ),
          )
              : Container()
      ),
    );
  }
}
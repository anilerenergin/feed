import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greatr_feed/models/post_model.dart';
import 'package:greatr_feed/screens/feed_screen.dart';

import '../firebase_functions/post_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

List<PostModel> posts = [];

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getAllPosts(posts).then((value) => Get.off(()=>FeedScreen(
          posts: posts,
        )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

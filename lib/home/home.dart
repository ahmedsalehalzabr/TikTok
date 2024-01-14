import 'package:flutter/material.dart';
import 'package:tiktok/home/following/following_video_screen.dart';
import 'package:tiktok/home/for_you/for_you_video_screen.dart';
import 'package:tiktok/home/upload_video/upload_video_screen.dart';

import 'profile/profile_screen.dart';
import 'search/search_screen.dart';
import 'upload_video/upload_custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _StateHomeScreen();
}

class _StateHomeScreen extends State<HomeScreen> {
  int screenIndex = 0;
  List screenList =
      [
        ForYouVideoScreen(),
        SearchScreen(),
        UploadVideoScreen(),
        FollowingVideoScreen(),
        ProfileScreen(),

      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index)
        {
          setState(() {
            screenIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30,),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30,),
              label: "Discover"
          ),
          BottomNavigationBarItem(
              icon: UploadCustomIcon(),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox_sharp, size: 30,),
              label: "Following"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30,),
              label: "Me"
          ),
        ],
      ),
      body: screenList[screenIndex],
    );
  }
}

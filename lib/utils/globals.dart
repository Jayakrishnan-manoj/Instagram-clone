import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('notif'),
  Text('profile'),
];

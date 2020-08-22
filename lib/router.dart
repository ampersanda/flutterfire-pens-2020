import 'package:firebase_crud/ui/chat/chat_screen.dart';
import 'package:firebase_crud/ui/session/session_screen.dart';
import 'package:firebase_crud/ui/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static const String initialRoute = SessionScreen.routeName;

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    SignInScreen.routeName: (_) => SignInScreen(),
    ChatScreen.routeName: (_) => ChatScreen(),
    SessionScreen.routeName: (_) => SessionScreen(),
  };
}

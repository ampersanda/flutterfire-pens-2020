import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/ui/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  static const String routeName = 'chat-screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatScreen'),
        actions: [
          FlatButton.icon(
            onPressed: _onSignOut,
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            label: Text('Sign Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _onSignOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Keluar'),
          content: Text('Anda yakin akan keluar?'),
          actions: [
            FlatButton(
              textColor: Colors.grey,
              child: Text('Ya'),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SignInScreen.routeName,
                  (_) => false,
                );
              },
            ),
            FlatButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

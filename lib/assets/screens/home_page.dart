import 'package:flutter/material.dart';
import 'package:flutter_application_login/assets/model/UserModel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _customTextRow(String caption) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(caption,
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0x00000000),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customTextRow('Email: ${widget.userModel.email}'),
            _customTextRow('Password: ${widget.userModel.password}'),
          ],
        ),
      ),
    );
  }
}

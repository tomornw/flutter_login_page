import 'package:flutter/material.dart';
import 'package:flutter_application_login/assets/model/UserModel.dart';
import 'package:flutter_application_login/assets/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  UserModel _userModel = new UserModel();
  TextEditingController _inputEmailController = new TextEditingController();
  TextEditingController _inputPasswordController = new TextEditingController();

  Widget _buildLogo() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.only(top: 10),
      child: Image.asset('lib/assets/images/logoMascotOrchid.png'),
      height: 150,
    );
  }

  Decoration _buildDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Colors.blue[300],
          Colors.blue[400],
          Colors.blue[600],
          Colors.blue[700],
        ]));
  }

  Widget _buildInput(
      String caption,
      IconData iconData,
      TextEditingController textEditingController,
      TextInputType textInputType) {
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            iconData,
            color: Colors.white,
          ),
          hintText: 'Enter your ' + caption,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildTextFormField(
      String caption,
      IconData iconData,
      TextEditingController textEditingController,
      TextInputType textInputType) {
    return TextFormField(
      keyboardType: textInputType,
      style: TextStyle(color: Colors.white),
      controller: textEditingController,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
        // labelText: caption,
        hintText: 'Enter your ' + caption,
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  Widget _buildForgetPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          'Forget password?',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('Hello');
        },
      ),
    );
  }

  Widget _customTextBorder(String caption, Widget inputText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caption,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: inputText,
          )
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          print('On Login...');
          _onLogin();
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              letterSpacing: 5),
        ),
      ),
    );
  }

  void _onLogin() {
    print(_inputEmailController.text);
    print(_inputPasswordController.text);
    setState(() {
      _userModel.email = _inputEmailController.text;
      _userModel.password = _inputPasswordController.text;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  userModel: _userModel,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0x00000000),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          _buildLogo(),
          // Text(
          //   'Sign In',
          //   style: TextStyle(fontSize: 30, color: Colors.white),
          // ),
          _customTextBorder(
              'Email',
              _buildInput('Email', Icons.email, _inputEmailController,
                  TextInputType.emailAddress)),
          SizedBox(
            height: 15,
          ),
          _customTextBorder(
              'Password',
              _buildTextFormField('Password', Icons.vpn_key,
                  _inputPasswordController, TextInputType.visiblePassword)),
          // _buildForgetPassword(),
          SizedBox(
            height: 15,
          ),
          _buildLoginButton(),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with
    SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this
    );
    animation = ColorTween(begin: Colors.lightBlue, end:
    Colors.blue).animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/shoppinglogo.png'),
                    height: 250,
                  ),
                ),
        SizedBox(
          width: 250.0,
          child: ColorizeAnimatedTextKit(
              onTap: () {
                print("Tap Event");
              },
              text: [
                "MF Shopping",
              ],
              textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Horizon",
              ),
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.red,
                Colors.pinkAccent,
              ],
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),
        ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

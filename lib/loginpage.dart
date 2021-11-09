import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasma_donor/constants.dart';
import 'signuppage.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("images/donor.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Container(
                decoration: kContainerforPages,
                child: TextField(
                  decoration: kWidgetDecor.copyWith(hintText: "ENTER EMAIL"),
                  onChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Container(
                decoration: kContainerforPages,
                child: TextField(
                    decoration:
                        kWidgetDecor.copyWith(hintText: "ENTER PASSWORD"),
                    onChanged: (value) {},
                    obscureText: true),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 20),
                child: FlatButton(
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 100,
                              spreadRadius: 10,
                              offset: Offset(0, 5))
                        ]),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  onPressed: () {},
                )),
            Row(),
          ],
        ),
      ),
    );
  }
}

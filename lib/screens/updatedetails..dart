import 'package:flutter/material.dart';

class UpdateDetails extends StatefulWidget {
  const UpdateDetails({Key? key}) : super(key: key);

  @override
  _UpdateDetailsState createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
              ),
              Text(
                'Jackson Hunt',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text('57 Years Old',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('B+',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,),),
                  SizedBox(width: 50,),
                  Text('Male',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,),),
                ],
              ),
              Text('Delhi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}

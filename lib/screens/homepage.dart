import 'package:flutter/material.dart';
import 'package:plasma_donor/constants.dart';
import '../register.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bloodcell.png'),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Text(
            'PLASME APP',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Plasma Donor Recepient Connector ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('success');
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details()));
                  },
                  child: Container(
                    width: 170,
                    height: 170,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/donors.png')),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 70,
                              spreadRadius: 10,
                              offset: Offset(0, 5))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: Text(
                        'DONOR',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details()));
                },
                child: Container(
                    width: 170,
                    height: 170,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/recepient.png')),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 70,
                              spreadRadius: 10,
                              offset: Offset(0, 5))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: Text(
                        'RECEPIENT',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

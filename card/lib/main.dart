import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          //backgroundColor: Colors.green[400],
          body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/northern_light.jpg'))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 1),
              Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/IMG_7948.JPG'),
                  //child: Text('ME!'),
                  radius: 60,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Quang Le',
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  // fontStyle: FontStyle.normal,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.0),
              Text('Flutter Developer',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'JuliusSansOne')),
              SizedBox(height: 25.0),
              Builder(builder: (context) {
                double screenWidth = MediaQuery.of(context).size.width;
                return Container(
                    width: screenWidth * 0.75,
                    color: Colors.white,
                    //color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                          ),
                          SizedBox(width: 25.0),
                          Text(
                            '+32 477606291',
                            style: TextStyle(
                              fontFamily: 'UbuntuMono',
                              fontSize: 18,
                            ),
                          ),
                          //Spacer(),
                        ],
                      ),
                    ));
              }),
              SizedBox(height: 20.0),
              Builder(builder: (context) {
                double screenWidth = MediaQuery.of(context).size.width;
                return Container(
                  width: screenWidth * 0.75,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.email,
                        ),
                        SizedBox(width: 25.0),
                        Text(
                          'dev.quang.le@gmail.com',
                          style: TextStyle(
                            fontFamily: 'UbuntuMono',
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              }),
              Spacer(flex: 2),
              Text("Made with Flutter - font by https://artsyomni.com/",
                  style: TextStyle(color: Colors.blueGrey[700])),
              SizedBox(height: 25),
            ],
          ),
        ),
      )),
    );
  }
}

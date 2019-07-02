import 'package:flutter_web/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.green[400],
          body: scaffoldHome(
              assetPath:'images/northern_light.jpg',
              child: Builder(builder:(context) {
                double screenWidth = MediaQuery
                    .of(context)
                    .size
                    .width;
                double screenHeight = MediaQuery
                    .of(context)
                    .size
                    .height;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 3),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/IMG_7948.JPG'),
                        radius: screenHeight > 500 ? 60 : 35,
                      ),
                    ),
                    SizedBox(height: screenHeight > 500 ? 15.0 : 7),
                    Text(
                      'Quang Le',
                      style: TextStyle(
                        fontSize: screenHeight > 500 ? 46 : 30,
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        // fontStyle: FontStyle.normal,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight > 500 ? 15.0 : 7),
                    Text('Flutter Developer',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'JuliusSansOne')),
                    SizedBox(
                        height: screenHeight > 500 ? 25.0 : 10.0,
                        width: screenWidth > 400 ? 150 : 75,
                        child: Divider(height: 10, color: Colors.white)),
                    _contactField(context, Icons.phone, 'tel: +32477606291',
                        '+32 477 60 62 91'),
                    SizedBox(height: screenHeight > 500 ? 10.0 : 5),
                    _contactField(
                        context,
                        Icons.email,
                        'mailto:dev.quang.le@gmail.com?subject=contact%20via%20your%20app&body=Say%20something%20nice%20here:',
                        'dev.quang.le@gmail.com'),
                    Spacer(flex: 4),
                    Text(
                      "Made by porting Flutter code to Flutter Web",
                      style: TextStyle(color: Colors.blueGrey[700]),
                    ),
                    SizedBox(height: screenHeight > 500 ? 25 : 10),
                  ],
                );

              }),
            ),
          )
    );
  }

  Widget _contactField(BuildContext context, IconData icon, String contactUrl,
      [String contactToDisplay]) {
    return Builder(builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
         width: screenWidth <= 356
      ? screenWidth * 0.9
          : screenWidth <= 540
      ? screenWidth * 0.7
          : screenWidth <= 880 ? screenWidth * 0.5 : screenWidth * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(icon, color: Colors.blue[900]),
              SizedBox(width: screenWidth>400?25.0:10),
              Text(
                contactToDisplay ?? contactUrl,
                style: TextStyle(
                  fontFamily: 'UbuntuMono',
                  fontSize: 18,
                  color: Colors.blue[900],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }


  Widget scaffoldHome({String assetPath, Widget child}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/northern_light.jpg'))),
      child: Center(child: child),
    );
  }


  //The problem with card is that you have to use margins to define the width.
  // I prefer to use Mediaquery to make it responsive
  Widget _cardExample() {
    return Card(
        margin: EdgeInsets.all(50),
        child: ListTile(
            leading: Icon(Icons.phone), title: Text('contact to display')));
  }
}



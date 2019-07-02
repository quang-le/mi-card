import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //backgroundColor: Colors.green[400],
      body: scaffoldHome(
        assetPath: 'assets/images/northern_lights.jpg',
        child: Column(
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
              child: RawMaterialButton(
                onPressed: () {
                  _launchURL(
                      'https://www.linkedin.com/in/quang-son-le-2b88988/');
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/IMG_7948.JPG'),
                  radius: 60,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'Quang Le',
              style: TextStyle(
                fontSize: 46,
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
            SizedBox(
                height: 25.0,
                width: 150,
                child: Divider(height: 10, color: Colors.white)),
            _contactField(
                context, Icons.phone, 'tel: +32477606291', '+32 477 60 62 91'),
            SizedBox(height: 10.0),
            _contactField(
                context,
                Icons.email,
                'mailto:dev.quang.le@gmail.com?subject=contact%20via%20your%20app&body=Say%20something%20nice%20here:',
                'dev.quang.le@gmail.com'),
            Spacer(flex: 4),
            Text(
              "Made with Flutter",
              style: TextStyle(color: Colors.blueGrey[700]),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    ));
  }

  Widget _contactField(BuildContext context, IconData icon, String contactUrl,
      [String contactToDisplay]) {
    return Builder(builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return RawMaterialButton(
        onPressed: () {
          _launchURL(contactUrl);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          width: screenWidth > 320 ? screenWidth * 0.7 : screenWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: Colors.blue[900]),
                SizedBox(width: 25.0),
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
        ),
      );
    });
  }

  //START shared widgets
  Widget scaffoldHome({String assetPath, Widget child}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/northern_light.jpg'))),
      child: Center(child: child),
    );
  }

  //END shared widgets
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

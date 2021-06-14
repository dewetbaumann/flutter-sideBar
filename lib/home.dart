import 'package:flutter/material.dart';

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  bool isTaped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff30384C),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              sideBar(),
              homeScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sideBar() {
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/profile.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Dewet Baumann',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          allOptions(),
        ],
      ),
    );
  }

  Expanded allOptions() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * .6,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          myCustomButton(Icons.person_outline, 'Mi Perfil'),
          myCustomButton(Icons.local_activity, 'Actividades'),
          myCustomButton(Icons.help_outline_outlined, 'Ayuda'),
          myCustomButton(Icons.support_agent, 'Soporte tecnico'),
          myCustomButton(Icons.logout, 'Cerrar sesion'),
        ],
      ),
    ));
  }

  TextButton myCustomButton(iconButton, textButton) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: <Widget>[
          Icon(
            iconButton,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            textButton,
            style: TextStyle(color: Colors.grey[700]),
          )
        ],
      ),
    );
  }

  Widget homeScreen() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: 0,
      bottom: 0,
      left: isTaped ? 0 : 0.6 * MediaQuery.of(context).size.width,
      right: isTaped ? 0 : -0.2 * MediaQuery.of(context).size.width,
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: 8,
        child: Column(
          children: <Widget>[
            customAppBar(),
          ],
        ),
      ),
    );
  }

  Container customAppBar() {
    return Container(
      color: Color(0xff30384C),
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                isTaped = !isTaped;
                print(isTaped);
              });
            },
            child: Icon(Icons.menu, color: Colors.white),
          ),
          Expanded(
              child: Center(
            child: Text(
              'Screen One',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )),
        ],
      ),
    );
  }
}

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
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            sideBar(),
            home(),
          ],
        ),
      ),
    );
  }

  Widget sideBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 21)),
            SizedBox(height: 10),
            Text("Messages",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("Utility Bills",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("Funds Transfer",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("Branches",
                style: TextStyle(color: Colors.white, fontSize: 22)),
          ],
        ),
      ),
    );
  }

  Widget home() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: 0,
      bottom: 0,
      left: isTaped ? 0 : 0.6 * MediaQuery.of(context).size.width,
      right: isTaped ? 0 : -0.2 * MediaQuery.of(context).size.width,
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: 8,
        color: Colors.grey[200],
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTaped = !isTaped;
                        print(isTaped);
                      });
                    },
                    child: Icon(Icons.menu),
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      'Screen One',
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

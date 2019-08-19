import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Model/homepagedata.dart';
import 'homepagewidget/homeappbar.dart';
import 'icons/my_flutter_app_icons.dart';
import 'homepagewidget/homelandscapelayout.dart';
import 'homepagewidget/homeportraitlayout.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: home',
      style: optionStyle,
    ),
    Text(
      'Index 1: members',
      style: optionStyle,
    ),
    Text(
      'Index 2: setting',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.group),
            title: Text('members'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.sliders),
            title: Text('setting'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ChangeNotifierProvider(
          builder: (context) => HomePageData(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Consumer<HomePageData>(
              builder: (context, data, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    orientation==Orientation.portrait?HomeAppBar():SizedBox(height: 20,),
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ScrollView(),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: orientation == Orientation.portrait
              ? HomePortraitLayout()
              : HomeLandScapeLayout(),
        );
      },
    );
  }
}





//https://dribbble.com/shots/6959677-Smart-home/attachments/1785?mode=media

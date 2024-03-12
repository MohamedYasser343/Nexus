// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Nexus/screens/home/Home.dart';
import 'package:Nexus/screens/home/Search.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool User_has_files = false;
  bool userGender = true;
  var UserFirstName = 'User';
  var userEmail = 'User@demo.com';

  late AssetImage userImage;

  void initializeUserImage() {
    userImage = userGender
        ? AssetImage('assets/male_user_pp_with_nexus.png')
        : AssetImage('assets/female_user_pp_with_nexus.png');
  }

  @override
  void initState() {
    super.initState();
    initializeUserImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF191919),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 34,
              ),
              Text(
                'Inbox',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'arial',
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            offset: Offset(10, 50),
            enableFeedback: true,
            icon: Icon(Icons.more_vert_rounded,
              color: Colors.white,
              size: 25,
              ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(//padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  title: Text(
                    '   My Account   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              // PopupMenuItem(
              //   child: ListTile(
              //     title: Text(
              //       '   Folders   ',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16,
              //       ),
              //     ),
              //     onTap: () {
              //       //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
              //     },
              //   ),
              // ),
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    '   Trash   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    '   Settings   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    '   Help   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    '   Log Out   ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ],
            color: Color(0xFF202020),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
      body: Container(

      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0XFF191919),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0xFF747EF5).withOpacity(.2),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color(0XFF535353),
              hoverColor: Color(0XFF535353),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabBackgroundColor: Color(0XFF535353),
              color: Colors.white,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                switch (index) {
                  case 0:
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => Home()));
                    break;
                  case 1:
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => Search()));
                    break;
                  case 2:
                    showPopupMenu(context);
                    break;
                  case 3:
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => Inbox()));
                    break;
                }
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.add_circle_outline_rounded,
                  text: 'Create',
                ),
                GButton(
                  icon: Icons.move_to_inbox_rounded,
                  text: 'Inbox',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void showPopupMenu(BuildContext context) {
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(70, 710, 0, 0),
    items: [
      PopupMenuItem(
        child: ListTile(
          title: Text(
            'Create New File',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          onTap: () {
            // Handle Create New File action
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text(
            'Create New Folder',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          onTap: () {
            // Handle Create New Folder action
          },
        ),
      ),
    ],
    color: Color(0xFF202020),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
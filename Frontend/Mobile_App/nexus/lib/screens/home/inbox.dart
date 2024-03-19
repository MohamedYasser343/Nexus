// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Nexus/screens/home/Home.dart';
import 'package:Nexus/screens/home/Search.dart';
import 'package:Nexus/constants/colors.dart';

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
        ? AssetImage('assets/icons/male_user_pp_with_nexus.png')
        : AssetImage('assets/icons/female_user_pp_with_nexus.png');
  }

  @override
  void initState() {
    super.initState();
    initializeUserImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.dark,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colors.primarybackground,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colors.textwhite,
                size: 34,
              ),
              Text(
                'Inbox',
                style: TextStyle(
                  color: colors.textwhite,
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
            icon: Icon(
              Icons.more_vert_rounded,
              color: colors.textwhite,
              size: 25,
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                //padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  title: Text(
                    '   My Account   ',
                    style: TextStyle(
                      color: colors.textwhite,
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
              //         color: colors.textwhite,
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
                      color: colors.textwhite,
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
                      color: colors.textwhite,
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
                      color: colors.textwhite,
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
                      color: colors.textred,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ],
            color: colors.dark,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: colors.dark,
              ),
            ),
            Positioned.fill(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                      ),
                      Text(
                        "There is No Notification Yet",
                        style: TextStyle(
                          color: colors.textwhite,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/no_notification.png'),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colors.primarybackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: colors.accent2.withOpacity(.2),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: colors.textsecondary,
              hoverColor: colors.textsecondary,
              gap: 8,
              activeColor: colors.textwhite,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabBackgroundColor: colors.textsecondary,
              color: colors.textwhite,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                switch (index) {
                  case 0:
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Home()));
                    break;
                  case 1:
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Search()));
                    break;
                  case 2:
                    showPopupMenu(context);
                    break;
                  case 3:
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Inbox()));
                    break;
                }
              },
              tabs: [
                GButton(
                  icon: CupertinoIcons.house,
                  text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: CupertinoIcons.plus_circle,
                  text: 'Create',
                ),
                GButton(
                  icon: CupertinoIcons.tray_arrow_down_fill,
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
              color: colors.textwhite,
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
              color: colors.textwhite,
              fontSize: 16,
            ),
          ),
          onTap: () {
            // Handle Create New Folder action
          },
        ),
      ),
    ],
    color: colors.dark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}

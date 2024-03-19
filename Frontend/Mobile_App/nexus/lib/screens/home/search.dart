// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unnecessary_import, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, avoid_unnecessary_containers, unused_import, unused_element
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Nexus/screens/home/Inbox.dart';
import 'package:Nexus/screens/home/Home.dart';
import 'package:Nexus/constants/colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    initializeUserImage();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    final userNameMassage = 'Hello, ' + UserFirstName;
    return Scaffold(
      backgroundColor: colors.primarybackground,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: colors.primarybackground,
        leading: Padding(
          padding: EdgeInsets.only(left: 0),
          child: InkWell(
            onTap: () {
              // Navigator.push(context, CupertinoPageRoute(builder: (context) => SettingsPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image(
                    image: userImage,
                  ),
                  onPressed: () {
                    // Handle the onPressed event
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userNameMassage,
                      style: TextStyle(
                        fontSize: 20,
                        color: colors.textwhite.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      userEmail,
                      style: TextStyle(
                        fontSize: 12,
                        color: colors.textwhite.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 90),
          // ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 30, bottom: 16, left: 30, right: 30),
              child: CupertinoSearchTextField(
                style: TextStyle(color: colors.textwhite),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: colors.divider,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: colors.divider,
                ),
                backgroundColor: colors.darkcontainer,
                controller: textController,
                placeholder: 'Search',
                placeholderStyle: TextStyle(color: colors.divider),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              "Try Searching For: ",
              style: TextStyle(
                  color: colors.textwhite,
                  fontFamily: "arial",
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: MaterialButton(
                  minWidth: double.minPositive,
                  height: 50,
                  onPressed: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                  color: colors.darkcontainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Create New File",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: colors.textwhite,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: MaterialButton(
                  minWidth: double.minPositive,
                  height: 50,
                  onPressed: () {
                    //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                  color: colors.darkcontainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Create New File",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: colors.textwhite,
                    ),
                  ),
                ),
              ),
            ),
          ])
        ],
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
                  icon: CupertinoIcons.tray_arrow_down,
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

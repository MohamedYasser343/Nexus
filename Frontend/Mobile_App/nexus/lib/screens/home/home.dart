// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_declarations, unused_local_variable, use_super_parameters, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_import, unused_element, sort_child_properties_last
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Nexus/screens/home/Inbox.dart';
import 'package:Nexus/screens/home/Search.dart';
import 'package:Nexus/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
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
        leadingWidth: 70,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: colors.primarybackground,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: EdgeInsets.only(left: 15, right: 0),
              onPressed: (){
                
              },
              icon: Image(
                  image: userImage,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
            );
          },
        ),
        title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Hello,  ' ,
                    style: TextStyle(
                      fontSize: 20,
                      color: colors.textwhite.withOpacity(0.8),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    UserFirstName,
                    style: TextStyle(
                      fontSize: 20,
                      color: colors.textwhite.withOpacity(0.8),
                    ),
                  ),
                ]
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
        actions: <Widget>[
          PopupMenuButton(
            offset: Offset(10, 50),
            enableFeedback: true,
            icon: Icon(CupertinoIcons.ellipsis_vertical,
              color: colors.textwhite,
              size: 25,
              ),
            itemBuilder: (BuildContext context) => [
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
            ],
            color: colors.dark,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                      Padding(padding: EdgeInsets.symmetric(vertical: 40),),
                      Text("There is Nothing Here Yet",
                        style: TextStyle(
                          color: colors.textwhite,
                          fontSize: 26,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/no_data_male.png'),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      MaterialButton(
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
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: colors.textwhite,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
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
                          "Create New Folder",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: colors.textwhite,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // MaterialButton(
                      //   minWidth: double.minPositive,
                      //   height: 50,
                      //   onPressed: () {
                      //     //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                      //   },
                      //   color: colors.darkcontainer,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Text(
                      //     "Import",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 18,
                      //       color: colors.textwhite,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // MaterialButton(
                      //   minWidth: double.minPositive,
                      //   height: 50,
                      //   onPressed: () {
                      //     //Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                      //   },
                      //   color: colors.darkcontainer,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Text(
                      //     "Templates",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 18,
                      //       color: colors.textwhite,
                      //     ),
                      //   ),
                      // ),
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
              color: colors.accent2.withOpacity(0.2),
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
              activeColor: colors.lightcontainer,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabBackgroundColor: colors.textsecondary,
              color: colors.lightcontainer,
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
                  icon: CupertinoIcons.home,
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
// Card( 
//   color: Colors.transparent,
//   elevation: 0,
//   child: ListTile(
//     leading: CircleAvatar(
//       radius: 28,
//       backgroundImage: userImage,
//     ),
//     title: Text(userNameMassage,
//       style: TextStyle(
//         fontSize: 20,
//         color: colors.textwhite.withOpacity(0.8),
//       ),
//     ),
//     subtitle: Text(
//       userEmail,
//       style: TextStyle(
//         fontSize: 12,
//         color: colors.textwhite.withOpacity(0.4),
//       ),
//     ),
//   ),
// ),
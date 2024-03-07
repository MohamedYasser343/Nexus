// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_declarations, unused_local_variable, use_super_parameters, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    final userNameMassage = 'Hello, ' + UserFirstName;
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Color(0XFF191919),
        leading: Padding(
          padding: EdgeInsets.only(left: 0),
          child: InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
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
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        userEmail,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.4),
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    '   Folders   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Color(0xFF202020),
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
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/no_data_male.png'),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      MaterialButton(
                        minWidth: double.minPositive,
                        height: 50,
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        color: Color(0XFF2B2B2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Create New File",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        minWidth: double.minPositive,
                        height: 50,
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        color: Color(0XFF2B2B2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Create New Folder",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        minWidth: double.minPositive,
                        height: 50,
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        color: Color(0XFF2B2B2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Import",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        minWidth: double.minPositive,
                        height: 50,
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        color: Color(0XFF2B2B2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Templates",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
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
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
            
      //       label: 'Home',
            //backgroundColor: Color(0XFF191919),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
            //backgroundColor: Color(0XFF191919),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_circle_outline_rounded),
      //       label: 'Create',
            //backgroundColor: Color(0XFF191919),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.move_to_inbox_rounded),
      //       label: 'Inbox',
            //backgroundColor: Color(0XFF191919),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   unselectedItemColor: Colors.white.withOpacity(0.5),
      //   selectedItemColor: Colors.white,
      //   backgroundColor: Color(0XFF191919),
      //   iconSize: 30,
      // ),
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
              //duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(0XFF535353),
              color: Colors.white,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
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
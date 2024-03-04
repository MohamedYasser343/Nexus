// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_declarations, unused_local_variable, use_super_parameters, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color(0XFF191919),
        actions: <Widget>[
          InkWell(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 92),
          ),
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
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/No_data_male.png'),
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
                      // SizedBox(height: 20),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 15),
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width / 2,
                      //     height: 2,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // MaterialButton(
                      //   minWidth: double.minPositive + 150,
                      //   height: 55,
                      //   onPressed: () {
                      //     //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      //   },
                      //   color: Color(0XFF2B2B2B),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Text(
                      //     "Folders",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 18,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // MaterialButton(
                      //   minWidth: double.minPositive + 150,
                      //   height: 55,
                      //   onPressed: () {
                      //     //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      //   },
                      //   color: Color(0XFF2B2B2B),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Text(
                      //     "Trash",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 18,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // MaterialButton(
                      //   minWidth: double.minPositive + 150,
                      //   height: 55,
                      //   onPressed: () {
                      //     //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      //   },
                      //   color: Color(0XFF2B2B2B),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Text(
                      //     "Help",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 18,
                      //       color: Colors.white,
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
    );
  }
}
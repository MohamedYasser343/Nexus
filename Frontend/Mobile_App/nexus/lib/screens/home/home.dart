// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_declarations, unused_local_variable, use_super_parameters, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    initializeUserImage(); // Call the method to initialize userImage
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
                SizedBox(width: 5,),
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
          SizedBox(width: 190,),
          IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
            ),
            color: Colors.white.withOpacity(0.6),
            iconSize: 30,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60),
        color: Color(0xFF202020),
        child: Stack(),
      ),
    );
  }
}

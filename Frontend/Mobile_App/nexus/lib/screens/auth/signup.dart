// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison, avoid_print, use_key_in_widget_constructors, use_super_parameters, prefer_final_fields
import 'package:flutter/cupertino.dart';
import 'package:Nexus/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:Nexus/screens/home/home.dart';
import 'package:Nexus/screens/auth/login.dart';
import 'package:international_phone_number_field/international_phone_number_field.dart';
import 'package:flutter/services.dart';
import 'package:Nexus/constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupPage(phoneNumberController: TextEditingController()),
    );
  }
}

class SignupPage extends StatefulWidget {
  final TextEditingController phoneNumberController;

  const SignupPage({Key? key, required this.phoneNumberController}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool passwordVisible1 = true;
  bool passwordVisible2 = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: colors.secondary,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage()),);
            //Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
            color: colors.primary2,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        color: colors.secondary,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.primary2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned.fill(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'arial',
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: colors.textwhite,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              buildFullNameField(),
                              SizedBox(height: 20),
                              buildUsernameField(),
                              SizedBox(height: 20),
                              buildEmailField(),
                              SizedBox(height: 20),
                              buildPhoneNumberField(),
                              SizedBox(height: 20),
                              buildPasswordField(),
                              SizedBox(height: 20),
                              buildConfirmPasswordField(),
                              SizedBox(height: 10),
                              if (!_passwordsMatch)
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Passwords do not match',
                                    style: TextStyle(
                                      color: colors.error,
                                    ),
                                  ),
                                ),
                              SizedBox(height: 10),
                              MaterialButton(
                                elevation: 10,
                                minWidth: MediaQuery.of(context).size.width - 60,
                                height: 60,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (_passwordController.text != _confirmPasswordController.text) {
                                      setState(() {
                                        _passwordsMatch = false;
                                      });
                                    } else {
                                      setState(() {
                                        _passwordsMatch = true;
                                      });
                                      Navigator.push(context, CupertinoPageRoute(builder: (context) => Home()));
                                    }
                                  } else {
                                    setState(() {
                                      _passwordsMatch = true;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please fill in all fields'),
                                      ),
                                    );
                                  }
                                },
                                color: colors.textwhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontFamily: 'arial',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: colors.primary2,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an Account?",
                            style: TextStyle(
                              color: colors.textwhite,
                            ),
                          ),
                          SizedBox(width: 0),
                          MaterialButton(
                            elevation: 10,
                            onPressed: () {
                              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: 'arial',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: colors.textwhite,
                                decoration: TextDecoration.underline,
                                decorationColor: colors.textwhite,
                              ),
                            ),
                          ),
                        ],
                      ),
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
Widget buildFullNameField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: [
          Icon(
            Icons.person_rounded,
            color: colors.textwhite,
          ),
          SizedBox(width: 5),
          Text(
            "Full Name",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: colors.textwhite,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Row( // New Row for text fields
        children: [
          Flexible(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter your First Name';
                }
                return null;
              },
              cursorColor: colors.textwhite,
              style: TextStyle(
                color: colors.textwhite,
              ),
              decoration: InputDecoration(
                fillColor: colors.accent.withOpacity(0.2),
                filled: true,
                hintText: "Enter your First Name",
                hintStyle: TextStyle(
                  color: colors.textwhite.withOpacity(0.7),
                  fontSize: 12,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.accent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.textwhite),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.textwhite),
                ),
                // error decoration
                errorStyle: TextStyle(color: colors.error),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.accent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.textwhite),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter your Last Name';
                }
                return null;
              },
              cursorColor: colors.textwhite,
              style: TextStyle(
                color: colors.textwhite,
              ),
              decoration: InputDecoration(
                fillColor: colors.accent.withOpacity(0.2),
                filled: true,
                hintText: "Enter your Last Name",
                hintStyle: TextStyle(
                  color: colors.textwhite.withOpacity(0.7),
                  fontSize: 12,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.accent2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.textwhite),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.textwhite),
                ),
                // error decoration
                errorStyle: TextStyle(color: colors.error),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.accent2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.textwhite),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

  Widget buildUsernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const [
            Icon(
              Icons.account_circle,
              color: colors.textwhite,
            ),
            SizedBox(width: 5),
            Text(
              "User Name",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: colors.textwhite,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Unique User Name';
            }
            return null;
          },
          cursorColor: colors.textwhite,
          style: const TextStyle(
            color: colors.textwhite,
          ),
          decoration: InputDecoration(
            fillColor: colors.accent.withOpacity(0.2),
            filled: true,
            hintText: "Enter your User Name",
            hintStyle: const TextStyle(
              color: colors.textwhite,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            errorStyle: const TextStyle(color: colors.error),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const [
            Icon(
              Icons.email_rounded,
              color: colors.textwhite,
            ),
            SizedBox(width: 5),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: colors.textwhite,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Email';
            }
            return null;
          },
          cursorColor: colors.textwhite,
          style: const TextStyle(
            color: colors.textwhite,
          ),
          decoration: InputDecoration(
            fillColor: colors.accent.withOpacity(0.2),
            filled: true,
            hintText: "Enter your Email",
            hintStyle: const TextStyle(
              color: colors.textwhite,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            errorStyle: const TextStyle(color: colors.error),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
          ),
        ),
      ],
    );
  }


Widget buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.phone_iphone_rounded,
              color: colors.textwhite,
            ),
            SizedBox(width: 5),
            Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: colors.textwhite,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        InternationalPhoneNumberInput(
          height: 50,
          controller: widget.phoneNumberController,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          formatter: MaskedInputFormatter('### ### ## ##'),
          initCountry: CountryCodeModel(
              name: "United States", dial_code: "+1", code: "US"),
          betweenPadding: 10,
          onInputChanged: (phoneNumber) {
            String fullNumber = widget.phoneNumberController.text;
            print(fullNumber); // This will print the full phone number with dial code
          },
          dialogConfig: DialogConfig(
            backgroundColor: colors.primary2,
            searchBoxBackgroundColor: colors.secondary,
            searchBoxIconColor: colors.lightcontainer,
            countryItemHeight: 55,
            flatFlag: true,
            topBarColor: Color.fromARGB(255, 41, 31, 100),
            selectedItemColor: colors.primary2,
            selectedIcon: Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            textStyle: TextStyle(
                color: colors.lightcontainer.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w600),
            searchBoxTextStyle: TextStyle(
                color: colors.lightcontainer.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w600),
            titleStyle: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 18,
                fontWeight: FontWeight.w700),
            searchBoxHintStyle: TextStyle(
                color: colors.lightcontainer.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          countryConfig: CountryConfig(
              decoration: BoxDecoration(
                color: colors.accent.withOpacity(0.2),
                border: Border.all(
                    width: 1, color: colors.accent2),
                borderRadius: BorderRadius.circular(8),
              ),
              flatFlag: false,
              noFlag: false,
              textStyle: const TextStyle(
                  color: colors.textwhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          validator: (input) {
            if (input == null || input.controller.text.isEmpty) {
              return "Please enter your phone number";
            }
            return null;
          },
          phoneConfig: PhoneConfig(
            focusedColor: colors.textwhite,
            enabledColor: colors.secondary,
            errorColor: colors.error,
            labelStyle: null,
            labelText: null,
            floatingLabelStyle: null,
            focusNode: null,
            radius: 8,
            hintText: "Phone Number",
            borderWidth: 1,
            backgroundColor: Color.fromARGB(26, 255, 255, 255),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 103, 96, 185).withOpacity(0.7),
              border: Border.all(
                    width: 1, color: colors.accent2),
                borderRadius: BorderRadius.circular(8),
            ),
            popUpErrorText: true,
            autoFocus: false,
            showCursor:false,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            errorTextMaxLength: 2,
            errorPadding: EdgeInsets.only(top: 14,left: MediaQuery.of(context).size.width * 0.19),
            errorStyle: TextStyle(color: colors.error, fontSize: 12, height: 1),
            textStyle: const TextStyle(
                color: colors.textwhite,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            hintStyle: TextStyle(
                color: colors.textwhite.withOpacity(0.7),
                fontSize: 12,),
          ), code: '', dial_code: '', number: '',
        ),
      ],
    );
  }

  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Icon(
                    Icons.lock,
                    color: colors.textwhite,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: colors.textwhite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password';
            }
            return null;
          },
          controller: _passwordController,
          cursorColor: colors.textwhite,
          style: const TextStyle(
            color: colors.textwhite,
          ),
          obscureText: passwordVisible1,
          decoration: InputDecoration(
            fillColor: colors.accent.withOpacity(0.2),
            filled: true,
            hintText: "Enter your Password",
            hintStyle: const TextStyle(
              color: colors.textwhite,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            errorStyle: const TextStyle(color: colors.error),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible1 = !passwordVisible1;
                });
              },
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    passwordVisible1 ? "Show" : "Hide",
                    style: TextStyle(
                      color: colors.accent2.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(width: 2,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Icon(
                    Icons.lock,
                    color: colors.textwhite,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: colors.textwhite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Password again';
            }
            return null;
          },
          controller: _confirmPasswordController,
          cursorColor: colors.textwhite,
          style: const TextStyle(
            color: colors.textwhite,
          ),
          obscureText: passwordVisible2,
          decoration: InputDecoration(
            fillColor: colors.accent.withOpacity(0.2),
            filled: true,
            hintText: "Enter your Password Again",
            hintStyle: const TextStyle(
              color: colors.textwhite,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            errorStyle: const TextStyle(color: colors.error),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.accent2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colors.textwhite),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible2 = !passwordVisible2;
                });
              },
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    passwordVisible2 ? "Show" : "Hide",
                    style: TextStyle(
                      color: colors.accent2.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(width: 2,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

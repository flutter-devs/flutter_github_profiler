import 'package:flutter/material.dart';
import 'package:github_flutter_ui/ui/HomePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var fkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(left: 100,bottom: 250,
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  child: Image.asset(
                    'assets/Octocat.png',
                    height: 600,
                    width: 600,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/Octocat.png',
                        height: 200,
                        width: 200,
                      ),
                      Form(
                        key: fkey,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.grey[400],
                              primaryColorDark: Colors.red,
                            ),
                            child: TextFormField(
                              controller: userNameController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Username';
                                } else if (value.contains(' ')) {
                                  return 'Please Enter valid username';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Username',
                                labelText: 'Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          color: Colors.blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            setState(() {
                              String username = userNameController.text;
                              print(userNameController.text);
                              if (fkey.currentState.validate()) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(username: username);
                                }));
                                userNameController.clear();
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 12, bottom: 12),
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
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

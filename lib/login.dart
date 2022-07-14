import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/home.dart';

//import 'ScreenConfig.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//  ScreenConfig ?screenConfig;
  //WidgetSize? widgetSize;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: const SizedBox(
                    child: Image(image: AssetImage("assets/index.jpg")),
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  //  color: Colors.yellow,
                  child: TextField(
                      controller: userController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFF000039)),
                      decoration: const InputDecoration(
                        fillColor: Colors.white, filled: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF000039),
                        ),
                        border: OutlineInputBorder(),
                        hoverColor: Color(0xFF800000),
                        focusColor: Color(0xFF800000),
                        //labelText: 'اسم المستخدم',
                        hintText: 'اسم المستخدم',
                        hintStyle: TextStyle(
                            color: Color(0xFF000039),
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  //  color: Colors.yellow,
                  child: TextField(
                      controller: passwordController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFF000039)),
                      decoration: const InputDecoration(
                        fillColor: Colors.white, filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFF000039),
                        ),
                        border: OutlineInputBorder(),
                        hoverColor: Color(0xFF800000),
                        focusColor: Color(0xFF800000),
                        //labelText: 'اسم المستخدم',
                        hintText: ' كلمة الســــر',
                        hintStyle: TextStyle(
                            color: Color(0xFF000039),
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  //  color: Colors.yellow,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    // height: 50,
                    //  width: 350,
                    decoration: BoxDecoration(
                        color: const Color(0xFF000039),
                        borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF191970)),
                      onPressed: () {
                        login(context);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const Home()));
                      },
                      child: const Text(
                        'دخول',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            ),
            Text('loading...')
          ],
        ),
      ),
    );
  }

  // ignore: override_on_non_overriding_member
  void showBar(BuildContext context, String msg) {
    var bar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(bar);
  }

  late int check;
  Future<void> login(BuildContext context) async {
    showLoadingDialog(context);
    var dio = Dio();
    final response = await dio.get(
      'http://62.12.101.62/TAC/Home/Login',
      queryParameters: {
        'username': userController.text,
        'password': passwordController.text,
      },
    );
    print(response.data);
    if (response.data['stutas'] == 1) {
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) =>  Home(data: response.data,)),
          (Route<dynamic> route) => false);
    } else {
      showBar(context, 'ليس لديك صلاحية دخول');
    }
    return response.data;
  }

  //   if (result.ok) {
  //     setState(() {
  //       check = result.data['stutas'];
  //       if (check == 1) {
  //         // sharedpreference.setString("token", result.data['token']);
  //         // sharedpreference.setString("user_id", result.data['id']);
  //         // sharedpreference.setString("login", 'ok');
  //         Navigator.of(context).pop();
  //         Navigator.of(context).pushAndRemoveUntil(
  //             MaterialPageRoute(builder: (BuildContext context) => Home()),
  //             (Route<dynamic> route) => false);
  //       }
  //       if (check == 2) {
  //         String res = result.data['error'];
  //         Navigator.of(context).pop();
  //         showBar(context, res);
  //       }
  //       if (check == 3) {
  //         Navigator.of(context).pop();
  //         String res = result.data['error'];
  //         showBar(context, res);
  //       }
  //     });
  //   }
  // }
}

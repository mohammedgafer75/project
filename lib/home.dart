import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/ads.dart';
//import 'package:project/login.dart';
import 'package:project/results.dart';
import 'package:project/tables.dart';

class Home extends StatefulWidget {
  const Home({Key? key,required this.data}) : super(key: key);
  final dynamic data;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Constant.inas,

        appBar: AppBar(
          backgroundColor: const Color(0xFF191970),
          title:  Text(
            'مرحبا بك : ${widget.data['name']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                // <-- SEE HERE
                decoration: BoxDecoration(color: Color(0xFF191970)),
                accountName: Text(
                  "تطبيق موبايل لخدمات الطلاب الجامعية",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/index.jpg'),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title:  Text('${widget.data['name']} : الاسم'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.class_,
                ),
                title:  Text('${widget.data['semesterName']} : السمستر'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.class_,
                ),
                title:  Text('${widget.data['departmentName']} : قسم '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    image: const AssetImage("assets/index.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF191970)),
                    onPressed: () {
                      print('إعلانات');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ads(data: widget.data,)));
                    },
                    //color: Color(0xFF000039),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'assets/ads.png',
                                color: Colors.white,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text('إعلانات',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    /*shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)),*/
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF191970)),

                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tables(data: widget.data)));
                    },
                    // color: Color(0xFF000039),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'assets/ads.png',
                                color: Colors.white,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text('الجداول',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    /* shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)),*/
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF191970)),

                    onPressed: () {
                      print('إعلانات');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Results(data: widget.data)));
                    },
                    //color: Color(0xFF000039),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'assets/ads.png',
                                color: Colors.white,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text('النتيجة',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    /*shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)),*/
                  ),
                ),
              ]),
            ))));
  }
}

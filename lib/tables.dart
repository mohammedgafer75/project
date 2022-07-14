import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  List<Uint8List> byets = [];
  int check = 0;
  Future initData() async {
    var dio = Dio();
    final response = await dio.get(
      'http://62.12.101.62/TAC/Home/GetImage',
      queryParameters: {
        'DepartmentID': widget.data['departmentID'],
        'SemesterID': widget.data['semesterID'],
        'type': 3
      },
    );
    List images = response.data;
    // print(response.data);
    images.forEach((element) {
      byets.add(base64.decode(element['image']));
    });
    check = 1;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF191970),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                "الجداول",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
          centerTitle: true,
          // backgroundColor: primary2Color,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: initData(),
            builder: (context, snapshot) {
              if (check == 0) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return byets.isEmpty
                    ? const Center(child: Text('لا توجد بيانات'))
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.1),
                                    BlendMode.dstATop),
                                image: const AssetImage("assets/index.jpg"),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: ListView.separated(
                            itemBuilder: (context, position) {
                              
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child:
                                      Image(image: MemoryImage(byets[position])),
                                ),
                              );
                            },
                            separatorBuilder: (context, position) {
                              return Card(
                                color: const Color(0xFF000039),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Separator $position',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                            itemCount: byets.length,
                          ),
                        ));
              }
            }));
  }
}

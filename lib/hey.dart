import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyHomePage(title: 'flutter Demo Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
        ),
        title: Text("wanda.s", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            height: 145,
            // color: Colors.amber,
            child: Row(
              children: [
                Container(
                  // color: Colors.red, //comment:
                  width: 165,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://th.bing.com/th/id/R.08bea75021413bc9e6f59b1fdf981fce?rik=nQ3qUU89rd9bvQ&pid=ImgRaw&r=0"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Wanda S.",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Text("photographer/New York",
                          style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.pink,
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "150",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(width: 13),
                            Column(
                              children: [
                                Text("5K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19)),
                                Text("Followers",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))
                              ],
                            ),
                            SizedBox(width: 13),
                            Column(
                              children: [
                                Text("100",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19)),
                                Text("Following",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 145,
                              height: 40,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue),
                                  ),
                                  onPressed: () {},
                                  child: Text("Follow")),
                            ),
                            SizedBox(width: 16),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 145,
            // color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(9),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://www.newdesignfile.com/postpic/2010/05/free-stock-photos-people_102217.jpg")),
                        shape: BoxShape.circle,
                        // color: Colors.orange
                      ),
                    ),
                    Text("Alexa"),
                  ],
                );
              },
              itemCount: 5,
            ),
          ),
          Divider(thickness: 2),
          Container(
            child: DefaultTabController(
                length: 3,
                child: TabBar(tabs: [
                  Tab(
                    text: 'Email',
                  ),
                  Tab(
                    text: 'Site',
                  ),
                  Tab(
                    text: 'Phone',
                  )
                ])),
            // color: Colors.purple,
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 350,
            // color: Colors.amber,
            child: GridView.builder(
              itemCount: 100,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(2),
                  height: 20,
                  // color: Colors.red,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_640.jpg"),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

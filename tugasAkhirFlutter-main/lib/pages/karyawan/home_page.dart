import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tugas_akhir_flutter/pages/auth/login_page.dart';
import 'package:tugas_akhir_flutter/widgets/date_range.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final users = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black45, Colors.blueGrey],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(users.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot data = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hii..',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data['name'],
                          style: TextStyle(
                              color: Colors.blueGrey[200],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ClipOval(
                          child: Container(
                            color: Colors.blueGrey[400],
                            width: 150,
                            height: 150,
                            child: Lottie.asset('images/lottie4.json'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'POLITEKNIK GAJAH TUNGGAL',
                          style: TextStyle(
                              // color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data['email'],
                          style: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[600],
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Total Jumlah Cuti : ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '${data['maxCuti'].toString()} days',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 2,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 1),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue[400],
                              // gradient: LinearGradient(
                              //     colors: [
                              //       Colors.black87,
                              //       Colors.blueGrey,
                              //     ],
                              //     begin: Alignment.topLeft,
                              //     end: Alignment.bottomRight),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DateRange(),
                                      ));
                                },
                                child: Center(
                                  child: Text(
                                    'Apply for Leave',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          child: Lottie.asset('images/lottie.json'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}

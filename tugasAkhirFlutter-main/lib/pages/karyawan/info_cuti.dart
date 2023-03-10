import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir_flutter/widgets/date_range.dart';

class InfoCuti extends StatefulWidget {
  const InfoCuti({super.key});

  @override
  State<InfoCuti> createState() => _InfoCutiState();
}

class _InfoCutiState extends State<InfoCuti> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text('Info Cuti'),
        // automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black45, Colors.blueGrey],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: users.doc(user!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot data = snapshot.data!;

              String datee = data['tanggalawal'];
              String date = data['tanggalakhir'];
              String des = data["keterangan"];

              String dateNow = DateTime.now().toString();
              // print(date.split(" ")[0]);
              // print(dateNow.split(" ")[0]);
              if (des == '' || des == null) {
                return Container();
              } else {
                if (date.split(" ")[0] == dateNow.split(" ")[0]) {
                  users.doc(user.uid).update({"status": "Pending"});
                }

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 0,
                    height: MediaQuery.of(context).size.height / 4.0,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Name',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 50),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(data['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Email',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 53),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(data['email'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Start Date',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 21),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(data['tanggalawal'].split(" ")[0],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('End Date',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 29),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(data['tanggalakhir'].split(" ")[0],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Description',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 12),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(data['keterangan'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Status',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 51),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(data['status'],
                                style: TextStyle(
                                    color: data['status'] == 'Approved'
                                        ? Colors.green
                                        : data['status'] == 'Rejected'
                                            ? Colors.red
                                            : Colors.amber,
                                    fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                    // trailing: ,
                  ),
                );
              }
              //else () {

              // }

            } else {
              return Text('Loading..');
            }
          }),

      //     StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
      //   builder: (_, snapshot) {
      //     if (snapshot.hasError) return Text('Error = ${snapshot.error}');

      //     if (snapshot.hasData) {
      //       final docs = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: docs.length,
      //         itemBuilder: (_, i) {
      //           final data = docs[i].data();
      //           return ListTile(
      //             title: Text(data['name']),
      //           );
      //         },
      //       );
      //     }

      //     return Center(child: CircularProgressIndicator());
      //   },
      // )
      // StreamBuilder<QuerySnapshot>(
      //     stream: users.snapshots(),
      //     builder: (_, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView(
      //             children:
      //                 snapshot.data!.docs.map((QueryDocumentSnapshot document) {
      //           return Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               color: Colors.blueGrey,
      //               width: MediaQuery.of(context).size.width / 1.2,
      //               height: MediaQuery.of(context).size.height / 6,
      //               // leading: CircleAvatar(child: Text(document['name'][0])),
      //               // title: Text('Name: ' + document['name']),
      //               // subtitle: Text('Email: ' + document['email']),
      //               child: Column(
      //                 // mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   SizedBox(
      //                     height: 10,
      //                   ),
      //                   Text(
      //                     'Name: ' + document['name'],
      //                     style: TextStyle(color: Colors.white, fontSize: 15),
      //                   ),
      //                   Text('Email: ' + document['email'],
      //                       style:
      //                           TextStyle(color: Colors.white, fontSize: 15)),
      //                   // Text('Awal Cuti: ' + document['tanggalawal'].toString(),
      //                   //     style:
      //                   //         TextStyle(color: Colors.white, fontSize: 15)),
      //                   // Text(
      //                   //     'Akhir Cuti: ' +
      //                   //         document['tanggalakhir'].toString(),
      //                   //     style:
      //                   //         TextStyle(color: Colors.white, fontSize: 15)),
      //                   // Text('Awal Cuti: ' + document['tanggalawal'].toString(),
      //                   //     style:
      //                   //         TextStyle(color: Colors.white, fontSize: 15)),
      //                   // Text(
      //                   //     'Akhir Cuti: ' +
      //                   //         document['tanggalakhir'].toString(),
      //                   //     style:
      //                   //         TextStyle(color: Colors.white, fontSize: 15)),
      //                   Text('Keterangan: ' + document['keterangan'],
      //                       style:
      //                           TextStyle(color: Colors.white, fontSize: 15)),
      //                 ],
      //               ),
      //               // trailing: ,
      //             ),
      //           );
      //         }).toList());
      //       } else {
      //         return Text('Loading..');
      //       }
      //     }),
    );
  }
}

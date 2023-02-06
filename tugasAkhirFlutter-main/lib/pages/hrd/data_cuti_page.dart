import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class DataCuti extends StatefulWidget {
  const DataCuti({Key? key}) : super(key: key);

  @override
  State<DataCuti> createState() => _DataCutiState();
}

class _DataCutiState extends State<DataCuti> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: StreamBuilder(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data!.docs.map((document) {
                if (document['role']! == 'Karyawan') {
                } else {
                  return Container();
                }
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.black54],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight),
                        border: Border.all(color: Colors.deepPurple, width: 4),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 3.5,
                    padding: EdgeInsets.all(8),
                    // leading: CircleAvatar(child: Text(document['name'][0])),
                    // title: Text('Name: ' + document['name']),
                    // subtitle: Text('Email: ' + document['email']),
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
                            Text(document['name'],
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
                            Text(document['email'],
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
                            Text(document['tanggalawal'].toString(),
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
                            Text(document['tanggalakhir'].toString(),
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
                            Text(document['keterangan'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Setujui',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.greenAccent),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 80,
                              height: 50,
                              child: new ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Batalkan',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // trailing: ,
                  ),
                );
              }).toList());
            } else {
              return Text('Loading..');
            }
          }),
    );
  }
}


// class InfoCuti extends StatefulWidget {
//   const InfoCuti({super.key});

//   @override
//   State<InfoCuti> createState() => _InfoCutiState();
// }

// class _InfoCutiState extends State<InfoCuti> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection("users");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Info Cuti'),
//         automaticallyImplyLeading: false,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.blueGrey, Colors.grey],
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight),
//           ),
//         ),
//       ),
//       body: StreamBuilder(
//           stream: users.snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView(
//                   children: snapshot.data!.docs.map((document) {
//                 return Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             colors: [Colors.black, Colors.black54],
//                             begin: FractionalOffset.topLeft,
//                             end: FractionalOffset.bottomRight),
//                         border: Border.all(color: Colors.deepPurple, width: 4),
//                         borderRadius: BorderRadius.circular(15)),
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     height: MediaQuery.of(context).size.height / 5,
//                     padding: EdgeInsets.all(8),
//                     // leading: CircleAvatar(child: Text(document['name'][0])),
//                     // title: Text('Name: ' + document['name']),
//                     // subtitle: Text('Email: ' + document['email']),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text('Name',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 50),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['name'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Email',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 53),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['email'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Start Date',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 21),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['tanggalawal'].toString(),
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('End Date',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 29),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['tanggalakhir'].toString(),
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text('Description',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 12),
//                             Text(':',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                             SizedBox(width: 10),
//                             Text(document['keterangan'],
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16))
//                           ],
//                         ),
//                       ],
//                     ),
//                     // trailing: ,
//                   ),
//                 );
//               }).toList());
//             } else {
//               return Text('Loading..');
//             }
//           }),

//       //     StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       //   builder: (_, snapshot) {
//       //     if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//       //     if (snapshot.hasData) {
//       //       final docs = snapshot.data!.docs;
//       //       return ListView.builder(
//       //         itemCount: docs.length,
//       //         itemBuilder: (_, i) {
//       //           final data = docs[i].data();
//       //           return ListTile(
//       //             title: Text(data['name']),
//       //           );
//       //         },
//       //       );
//       //     }

//       //     return Center(child: CircularProgressIndicator());
//       //   },
//       // ),
//       //   StreamBuilder<QuerySnapshot>(
//       //       stream: users.snapshots(),
//       //       builder: (_, snapshot) {
//       //         if (snapshot.hasData) {
//       //           return ListView(
//       //               children:
//       //                   snapshot.data!.docs.map((QueryDocumentSnapshot document) {
//       //             return Padding(
//       //               padding: const EdgeInsets.all(8.0),
//       //               child: Container(
//       //                 color: Colors.blueGrey,
//       //                 width: MediaQuery.of(context).size.width / 1.2,
//       //                 height: MediaQuery.of(context).size.height / 6,
//       //                 // leading: CircleAvatar(child: Text(document['name'][0])),
//       //                 // title: Text('Name: ' + document['name']),
//       //                 // subtitle: Text('Email: ' + document['email']),
//       //                 child: Column(
//       //                   // mainAxisAlignment: MainAxisAlignment.start,
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     SizedBox(
//       //                       height: 10,
//       //                     ),
//       //                     Text(
//       //                       'Name: ' + document['name'],
//       //                       style: TextStyle(color: Colors.white, fontSize: 15),
//       //                     ),
//       //                     Text('Email: ' + document['email'],
//       //                         style:
//       //                             TextStyle(color: Colors.white, fontSize: 15)),
//       //                     // Text('Awal Cuti: ' + document['tanggalawal'].toString(),
//       //                     //     style:
//       //                     //         TextStyle(color: Colors.white, fontSize: 15)),
//       //                     // Text(
//       //                     //     'Akhir Cuti: ' +
//       //                     //         document['tanggalakhir'].toString(),
//       //                     //     style:
//       //                     //         TextStyle(color: Colors.white, fontSize: 15)),
//       //                     // Text('Awal Cuti: ' + document['tanggalawal'].toString(),
//       //                     //     style:
//       //                     //         TextStyle(color: Colors.white, fontSize: 15)),
//       //                     // Text(
//       //                     //     'Akhir Cuti: ' +
//       //                     //         document['tanggalakhir'].toString(),
//       //                     //     style:
//       //                     //         TextStyle(color: Colors.white, fontSize: 15)),
//       //                     Text('Keterangan: ' + document['keterangan'],
//       //                         style:
//       //                             TextStyle(color: Colors.white, fontSize: 15)),
//       //                   ],
//       //                 ),
//       //                 // trailing: ,
//       //               ),
//       //             );
//       //           }).toList());
//       //         } else {
//       //           return Text('Loading..');
//       //         }
//       //       }),
//     );
//   }
// }

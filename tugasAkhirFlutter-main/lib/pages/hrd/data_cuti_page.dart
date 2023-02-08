import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class DataCutiPage extends StatefulWidget {
  const DataCutiPage({Key? key}) : super(key: key);

  @override
  State<DataCutiPage> createState() => _DataCutiPageState();
}

class _DataCutiPageState extends State<DataCutiPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      appBar: AppBar(
        title: const Text('Leave Data'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black87, Colors.deepPurple],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      // body: StreamBuilder(
      //     stream: users.snapshots(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView(
      //             children: snapshot.data!.docs.map((document) {
      //           if (document['role']! == 'Karyawan') {
      //           } else {
      //             return Container();
      //           }
      //           return Padding(
      //             padding: const EdgeInsets.all(10),
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   gradient: LinearGradient(
      //                       colors: [Colors.black, Colors.black54],
      //                       begin: FractionalOffset.topLeft,
      //                       end: FractionalOffset.bottomRight),
      //                   border: Border.all(color: Colors.deepPurple, width: 4),
      //                   borderRadius: BorderRadius.circular(15)),
      //               width: MediaQuery.of(context).size.width,
      //               height: MediaQuery.of(context).size.height / 4.5,
      //               padding: EdgeInsets.all(8),
      //               // leading: CircleAvatar(child: Text(document['name'][0])),
      //               // title: Text('Name: ' + document['name']),
      //               // subtitle: Text('Email: ' + document['email']),
      //               child: Column(
      //                 // mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Row(
      //                     children: [
      //                       Text('Name',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 50),
      //                       Text(':',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 10),
      //                       Text(document['name'],
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16))
      //                     ],
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text('Email',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 53),
      //                       Text(':',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 10),
      //                       Text(document['email'],
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16))
      //                     ],
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text('Start Date',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 21),
      //                       Text(':',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 10),
      //                       Text(document['tanggalawal'].toString(),
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16))
      //                     ],
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text('End Date',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 29),
      //                       Text(':',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 10),
      //                       Text(document['tanggalakhir'].toString(),
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16))
      //                     ],
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Row(
      //                     children: [
      //                       Text('Description',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 12),
      //                       Text(':',
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16)),
      //                       SizedBox(width: 10),
      //                       Text(document['keterangan'],
      //                           style: TextStyle(
      //                               color: Colors.white, fontSize: 16))
      //                     ],
      //                   ),
      //                   SizedBox(
      //                     height: 15,
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       SizedBox(
      //                         width: 100,
      //                         height: 40,
      //                         child: ElevatedButton(
      //                           onPressed: () {},
      //                           child: Text(
      //                             'Approve',
      //                             style: TextStyle(
      //                                 color: Colors.white, fontSize: 12),
      //                           ),
      //                           style: ButtonStyle(
      //                             backgroundColor:
      //                                 MaterialStateProperty.all<Color>(
      //                                     Colors.green),
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: 100,
      //                         height: 40,
      //                         child: new ElevatedButton(
      //                           onPressed: () {},
      //                           child: Text(
      //                             'Reject',
      //                             style: TextStyle(
      //                                 color: Colors.white, fontSize: 12),
      //                           ),
      //                           style: ButtonStyle(
      //                             backgroundColor:
      //                                 MaterialStateProperty.all<Color>(
      //                                     Colors.red),
      //                           ),
      //                         ),
      //                       )
      //                     ],
      //                   ),
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
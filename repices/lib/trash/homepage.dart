// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import 'package:repices/pages/details.dart';
// import 'package:repices/services/recipe_service.dart';
// import 'package:repices/state_data.dart';
// import 'package:repices/widgets/appbar.dart';
// import 'package:repices/widgets/recipe_card.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // Services _recipeServices = Services();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // _recipeServices.fetchData();
//   }

//   Future<List> _getIcindekilerList() async {
//     String search = "salad";
//     try {
//       var response = await Dio().get(
//           'https://api.edamam.com/search?q=$search&app_id=0e8815f8&app_key=4b6ff7e246529f262865656ad6f35db2');
//       // List<IcindekilerModel> _icindekilerListe = [];
//       List labelList = [];
//       if (response.statusCode == 200) {
//         // _icindekilerListe =
//         //     (response.data['hits'][0]['recipe']['ingredients'] as List)
//         //         .map((e) => IcindekilerModel.fromMap(e))
//         //         .toList();
//       }
//       print(response.data['q']);
//       for (var i = 0; i < 9; i++) {
//         labelList.add(response.data['hits'][i]['recipe']['label']);
//       }

//       return labelList;
//     } on DioError catch (e) {
//       return Future.error(e.message.toString());
//     }
//   }

//   Widget build(BuildContext context) {
//     Function addList = Provider.of<StateDataCH>(context).addList;
//     return Scaffold(
//       appBar: AppBar(
//         title: GestureDetector(
//           onTap: () {},
//           child: const Text(
//             "  Recipes",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         // shape: const RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.only(
//         //     bottomRight: Radius.circular(25),
//         //     bottomLeft: Radius.circular(25),
//         //   ),
//         // ),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.favorite_border),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.search),
//           ),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//       body: 
//       Center(
//         child: FutureBuilder<List>(
//           future: _getIcindekilerList(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var result = snapshot.data!;
//               return ListView.builder(
//                 itemBuilder: (context, index) {
//                   var user = result[index];
//                   return InkWell(
//                     onTap: () {
//                       addList(user);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailPage(user, index)));
//                     },
//                     child: AspectRatio(
//                       aspectRatio: 1.65,
//                       child: Container(
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.all(8),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       user,
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             AspectRatio(
//                               aspectRatio: 0.71,
//                               child: Image.network(
//                                 "https://github.com/BayCandan/SpyGame-1.0.0/blob/main/spy/assets/card_icon.png?raw=true",
//                                 fit: BoxFit.cover,
//                                 alignment: Alignment.centerLeft,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: result.length,
//               );
//             } else if (snapshot.hasError) {
//               return Text(snapshot.error.toString());
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import 'package:repices/state_data.dart';

// import '../services/recipe_service.dart';
// // import 'package:riverpod/riverpod.dart';

// class DetailPage extends StatelessWidget {
//   DetailPage(
//     user,
//     index, {
//     super.key,
//   });

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//       Services services = Services();

//     Size size = MediaQuery.of(context).size;
//     Function newSearch = Provider.of<StateDataCH>(context).newSearch;
//     String name = Provider.of<StateDataCH>(context).name;
//     int index = Provider.of<StateDataCH>(context).index;
//     services.getDetail();
//     return Scaffold(
//       body: Container(
//         width: size.width,
//         child: Image.network(
//           "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg",
//           fit: BoxFit.cover,
//         ),
//       ),
//       bottomSheet: Container(
//         height: size.height / 1.65,
//         width: size.width,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 195, 243, 196),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: 16),
//                   height: 5,
//                   width: 32 * 1.5,
//                   decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         colors: [Colors.red, Colors.blue],
//                       ),
//                       borderRadius: BorderRadius.circular(3)),
//                 ),
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     name.toString(),
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 32,
//                         fontWeight: FontWeight.w600),
//                         maxLines: 3,
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 padding: EdgeInsets.all(10),
//                 width: 500,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black54),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     // Text(index.toString()),
//                     Text("ICINDEKILER:"),
                    
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 padding: EdgeInsets.all(10),
//                 width: 500,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black54),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Text("Tarif"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:repices/state_data.dart';

import '../services/recipe_service.dart';
// import 'package:riverpod/riverpod.dart';

class DetailPage extends StatelessWidget {


  @override
  Widget build(
    BuildContext context,
  ) {
    Services services = Services();

    Size size = MediaQuery.of(context).size;
    List butunListe = Provider.of<StateDataCH>(context).listState;
    int index = Provider.of<StateDataCH>(context).index;
    // Function newSearch = Provider.of<StateDataCH>(context).newSearch;
    // String name = Provider.of<StateDataCH>(context).name;
    // int index = Provider.of<StateDataCH>(context).index;
    // services.getDetail();
  
    return Scaffold(
       appBar: AppBar(
        title: Text("SELAMUN ALEYKUM"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        // height: 250,

        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.network(
          "${butunListe[index]['recipe']['image']}",
          fit: BoxFit.cover,
        ),
      ),
      bottomSheet: Expanded(
        child: Container(
          height: size.height / 1.5,
          width: size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 195, 243, 196),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  5.0,
                  -6.0,
                ),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(-5.0, -6.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 5,
                    width: 32 * 1.5,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.red, Colors.blue],
                        ),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                ),
                Container(
                  // height: 100,
                  // color: Colors.amber,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "sA",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                )
                // Expanded(
                //   child: FutureBuilder<List>(
                //     future: services.getDetail(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         var result = snapshot.data!;
                //         return ListView.builder(
                //           itemBuilder: (context, index) {
                //             var data = result[index];
                //             return InkWell(
                //               child: AspectRatio(
                //                 aspectRatio: 7,
                //                 child: Container(
                //                   margin: EdgeInsets.symmetric(
                //                       horizontal: 5, vertical: 5),
                //                   decoration: BoxDecoration(
                //                     // color: Colors.grey.shade200,
                //                     borderRadius: BorderRadius.circular(10),
                //                   ),
                //                   child: Row(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     mainAxisAlignment: MainAxisAlignment.end,
                //                     children: [
                //                       Expanded(
                //                         child: Padding(
                //                           padding: EdgeInsets.all(4),
                //                           child: Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             children: [
                //                               Expanded(
                //                                 child: Text(
                //                                   "* $data",
                //                                   textAlign: TextAlign.left,
                //                                   style: TextStyle(
                //                                     fontSize: 15,
                //                                   ),
                //                                 ),
                //                               )
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //           itemCount: result.length,
                //         );
                //       } else if (snapshot.hasError) {
                //         return Text(snapshot.error.toString());
                //       } else {
                //         return Container();
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

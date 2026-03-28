import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'carrito_screen.dart';

class HamburguesasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B0A2E),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF2B0A2E),
        elevation: 10,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarritoScreen(),
            ),
          );
        },
        child: Icon(Icons.shopping_cart, color: Colors.white),
      ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "HAMBURGUESAS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "OTTO DASH",
                      style: TextStyle(
                        color: Color(0xFFFF00CC),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              // lista
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('hamburguesas')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    var docs = snapshot.data!.docs;

                    return ListView(
                      children: [

                        //  HAMBURGUESAS
                        ...docs.map((data) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data['imagen'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['nombre'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "S/ ${data['precio']}",
                                        style: TextStyle(
                                          color: Color(0xFFFF00CC),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Icon(Icons.add_shopping_cart,
                                    color: Color(0xFFFF00CC)),
                              ],
                            ),
                          );
                        }).toList(),

                        // SUBTITULO COMBOS
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "COMBOS DESTACADOS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // COMBOS FIREBASE
                        Container(
                          height: 160,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('combos')
                                .snapshots(),
                            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                              if (!snapshot.hasData) {
                                return Center(child: CircularProgressIndicator());
                              }

                              var combos = snapshot.data!.docs;

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: combos.length,
                                itemBuilder: (context, index) {
                                  var data = combos[index];

                                  return Container(
                                    width: 160,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF00CC),
                                          Color(0xFFFF1493),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            data['imagen'],
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        SizedBox(height: 10),

                                        Text(
                                          data['nombre'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "S/ ${data['precio']}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
             ],
          ),
        ),
      );
    }
  }


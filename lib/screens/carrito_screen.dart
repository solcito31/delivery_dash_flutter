import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarritoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B0A2E),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF00CC),
        onPressed: () {},
        child: Icon(Icons.shopping_cart, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //menu
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(Icons.home, "Inicio", false),
              _navItem(Icons.search, "Buscar", false),
              SizedBox(width: 40),
              _navItem(Icons.receipt, "Pedidos", true),
              _navItem(Icons.person, "Perfil", false),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "OTTO DASH",
                    style: TextStyle(
                      color: Color(0xFFFF00CC),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Icon(Icons.shopping_cart, color: Colors.white),
                ],
              ),

              SizedBox(height: 20),


              Text(
                "Mi carrito",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),


              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('carrito')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    var docs = snapshot.data!.docs;

                    int total = 0;

                    for (var item in docs) {
                      total += (item['precio'] as int);
                    }

                    return Column(
                      children: [

                        //lista
                        Expanded(
                          child: ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              var data = docs[index];

                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [

                                    Image.network(
                                      data['imagen'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),

                                    SizedBox(width: 10),

                                    Expanded(
                                      child: Text(
                                        data['nombre'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),

                                    Text(
                                      "S/ ${data['precio']}",
                                      style: TextStyle(
                                          color: Color(0xFFFF00CC)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        // resumen
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              _resumenItem("Subtotal", "S/ $total"),
                              _resumenItem("Delivery", "S/ 5"),
                              Divider(color: Colors.white24),
                              _resumenItem("Total", "S/ ${total + 5}",
                                  isTotal: true),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),


                        Text(
                          "Tiempo estimado: 25 - 30 minutos",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),

                        SizedBox(height: 10),

                        //boton
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF00CC),
                                Color(0xFFFF1493),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding:
                              EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () {},
                            child: Text(
                              "CONTINUAR PEDIDO",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //resumen
  Widget _resumenItem(String titulo, String valor,
      {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titulo,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.white70,
            fontWeight:
            isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          valor,
          style: TextStyle(
            color: Color(0xFFFF00CC),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            color: active
                ? Color(0xFFFF00CC)
                : Colors.white54),
        Text(label,
            style: TextStyle(
                color: active
                    ? Color(0xFFFF00CC)
                    : Colors.white54,
                fontSize: 12)),
      ],
    );
  }
}
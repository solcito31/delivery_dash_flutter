import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B0A2E),

      // BOTÓN FLOTANTE
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF00CC),
        onPressed: () {},
        child: Icon(Icons.shopping_cart, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BOTTOM NAV
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(Icons.home, "Inicio", true),
              _navItem(Icons.search, "Buscar", false),
              SizedBox(width: 40), // espacio FAB
              _navItem(Icons.receipt, "Pedidos", false),
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

              //  UBICACIÓN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFFFF00CC)),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ENVIAR A",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 12)),
                          Text("Lima, Perú",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFFFF00CC),
                    child: Icon(Icons.person, color: Colors.black),
                  )
                ],
              ),

              SizedBox(height: 20),

              // 🔍 BUSCADOR
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Buscar comidas...",
                    hintStyle: TextStyle(color: Colors.white38),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white54),
                  ),
                ),
              ),

              SizedBox(height: 25),

              // CATEGORÍAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categorías",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text("Ver todos",
                      style: TextStyle(color: Color(0xFFFF00CC))),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _category(Icons.fastfood, "Hamburguesas"),
                  _category(Icons.local_pizza, "Pizza"),
                  _category(Icons.ramen_dining, "Sushi"),
                  _category(Icons.local_drink, "Bebidas"),
                ],
              ),

              SizedBox(height: 25),

              //  ENVÍO GRATIS
              Text("Envío Gratis",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),

            ],
          ),
        ),
      ),
    );
  }

  // ITEM NAV
  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            color: active ? Color(0xFFFF00CC) : Colors.white54),
        Text(label,
            style: TextStyle(
                color: active ? Color(0xFFFF00CC) : Colors.white54,
                fontSize: 12)),
      ],
    );
  }

  //  CATEGORÍA
  Widget _category(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Color(0xFFFF00CC)),
        ),
        SizedBox(height: 8),
        Text(text,
            style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
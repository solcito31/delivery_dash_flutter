import 'package:flutter/material.dart';

import 'home_screen.dart';
class VerificacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B0A2E),
      body: SafeArea(
        child: Column(
          children: [

            // 🔙 BOTÓN ATRÁS
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),

            // 📱 ICONO
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.sms,
                color: Color(0xFFFF00CC),
                size: 40,
              ),
            ),

            SizedBox(height: 20),

            // TITULO
            Text(
              "VERIFICACIÓN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Ingresa el código enviado",
              style: TextStyle(color: Colors.white54),
            ),

            SizedBox(height: 40),

            // 🔢 CAJAS OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xFFFF00CC)),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 40),

            // 🔥 BOTÓN VERIFICAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF00CC),
                      Color(0xFFFF1493),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFF00CC).withOpacity(0.6),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Código reenviado")),
                      );
                    },

                  child: Text(
                    "VERIFICAR",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // REENVIAR
            TextButton(
              onPressed: () {
                },
              child: Text(
                "Reenviar código",
                style: TextStyle(color: Color(0xFFFF00CC)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
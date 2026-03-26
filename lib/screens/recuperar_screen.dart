import 'package:flutter/material.dart';
import 'verificacion_screen.dart';

import 'home_screen.dart';
class RecuperarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B0A2E), // fondo oscuro fucsia
      body: SafeArea(
        child: SingleChildScrollView(
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

              // 🔒 ICONO
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.lock_reset,
                  color: Color(0xFFFF00CC),
                  size: 40,
                ),
              ),

              SizedBox(height: 20),

              // TITULO
              Text(
                "¿OLVIDASTE TU\nCLAVE?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "DELIVERY DASH • SEGURIDAD DE CUENTA",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: 30),

              // 📦 CARD
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Recuperar acceso",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Introduce tu dirección de correo electrónico vinculada a Delivery Dash. Te enviaremos un código de seguridad para restablecer tu contraseña.",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      "CORREO ELECTRÓNICO",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),

                    SizedBox(height: 10),

                    // INPUT
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "ejemplo@deliverydash.com",
                        hintStyle: TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.black26,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.white54),
                      ),
                    ),

                    SizedBox(height: 25),

                    // 🔥 BOTÓN NEÓN
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificacionScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "ENVIAR CÓDIGO",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Center(
                      child: Column(
                        children: [
                          Text(
                            "¿NO TIENES ACCESO A TU CORREO?",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "CONTACTAR SOPORTE",
                            style: TextStyle(
                              color: Color(0xFFFF00CC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Text(
                "— NEON PULSE SYSTEM —",
                style: TextStyle(
                  color: Colors.white30,
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
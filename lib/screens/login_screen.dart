import 'package:flutter/material.dart';
import '../main.dart';
import 'home_screen.dart';
import 'registro_screen.dart';
import 'recuperar_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B0A2E),
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

              // ⚡ ICONO + LOGO
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.bolt,
                  color: Color(0xFFFF00CC),
                  size: 40,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "DELIVERY DASH",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: 30),

              // 📦 CARD LOGIN
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [

                    Text(
                      "INICIAR SESIÓN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 20),

                    // EMAIL
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.black26,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.white54),
                      ),
                    ),

                    SizedBox(height: 15),

                    // CONTRASEÑA
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        labelStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.black26,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.white54),
                      ),
                    ),

                    SizedBox(height: 10),

                    // OLVIDASTE
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecuperarScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "¿Olvidaste tu contraseña?",
                          style: TextStyle(color: Color(0xFFFF00CC)),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

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
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "INICIAR SESIÓN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // REGISTRARSE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿No tienes cuenta? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistroScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Regístrate",
                            style: TextStyle(
                              color: Color(0xFFFF00CC),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
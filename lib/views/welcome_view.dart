import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo con filtro de desenfoque para mayor legibilidad
          SizedBox.expand(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/images/bg1.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topRight,
              ),
            ),
          ),
          // Capa de oscurecimiento con gradiente para un efecto más moderno
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Contenido centrado
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo circular (si tienes uno, si no, omite este widget)
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: Image.asset(
                        'assets/images/logo.png', // Cambia por tu logo si tienes
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Título más grande y con sombra
                    const Text(
                      'QONTA',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        letterSpacing: 4,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Subtítulo motivacional
                    Text(
                      '¡Bienvenido a la nueva forma de gestionar tus finanzas!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 80),
                    // Botón principal con efecto de sombra y mayor tamaño
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          elevation: 6,
                          shadowColor: kPrimaryColor.withOpacity(0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Navegar al login
                        },
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Botón secundario (opcional: "Explorar sin cuenta")
                    TextButton(
                      onPressed: () {
                        // Acción opcional
                      },
                      child: Text(
                        'Explorar sin cuenta',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Línea divisoria decorativa
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white24,
                            thickness: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'o',
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white24,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Registro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿No tienes una cuenta? ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navegar al registro
                          },
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

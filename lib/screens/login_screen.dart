import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallenato/providers/provider_web.dart';
import 'package:vallenato/themes/theme_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool estado = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Scaffold(
      // 🔥 CLAVE: evita re-layout agresivo cuando aparece teclado
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),

        child: SafeArea(
          child: AnimatedPadding(
            // 🔥 CLAVE: animación controlada (más suave que ScrollView)
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,

            padding: EdgeInsets.only(bottom: viewInsets.bottom),

            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.manual,

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.015),

                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: size.width * 0.085,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: size.height * 0.01),

                    Text(
                      'Inicia sesión para continuar',
                      style: TextStyle(
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: size.width * 0.35,
                          height: size.width * 0.35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: ThemeApp.dorado,
                            ),
                            borderRadius: BorderRadius.circular(
                              size.width * 0.175,
                            ),
                            color: const Color.fromARGB(255, 30, 20, 0),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          height: size.width * 0.2,
                          child: Image.asset(
                            'assets/acordeon.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.05),

                    Form(
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.9,
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: ThemeApp.dorado,
                                fontWeight: FontWeight.w300,
                              ),
                              cursorColor: ThemeApp.dorado,
                              decoration: InputDecoration(
                                label: Row(
                                  children: const [
                                    Icon(Icons.email, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text(
                                      'Correo electrónico',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(181, 77, 77, 77),
                                    width: 1.4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(181, 77, 77, 77),
                                    width: 1.4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          SizedBox(
                            width: size.width * 0.9,
                            child: TextFormField(
                              controller: _password,
                              obscureText: estado,
                              style: TextStyle(
                                color: ThemeApp.dorado,
                                fontWeight: FontWeight.w300,
                              ),
                              cursorColor: ThemeApp.dorado,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      estado = !estado;
                                    });
                                  },
                                  icon: Icon(
                                    estado
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                                label: Row(
                                  children: const [
                                    Icon(Icons.key, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text(
                                      'Contraseña',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(181, 77, 77, 77),
                                    width: 1.4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(181, 77, 77, 77),
                                    width: 1.4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.03),

                          SizedBox(
                            width: size.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () async {
                                final respuesta =
                                    await Provider.of<ProviderWeb>(
                                  context,
                                  listen: false,
                                ).loginWeb(
                                  _email.text,
                                  _password.text,
                                );

                                if (respuesta == true) {
                                  if (!context.mounted) return;
                                  Navigator.pushReplacementNamed(
                                      context, '/inicio');
                                } else {
                                  debugPrint(
                                    "Usuario no existe o credenciales incorrectas",
                                  );
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(
                                  ThemeApp.dorado,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: const Color.fromARGB(255, 8, 5, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿No tienes cuenta?",
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/register',
                            );
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Text(
                            'Registrate',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: ThemeApp.dorado,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
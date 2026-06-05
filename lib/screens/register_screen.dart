import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vallenato/providers/provider_web.dart';
import 'package:vallenato/themes/theme_app.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _alias = TextEditingController();
  final _email = TextEditingController();
  final _passowrd = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _aliasFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    _nameFocus.addListener(() { if (_nameFocus.hasFocus) SystemChannels.textInput.invokeMethod('TextInput.show'); });
    _aliasFocus.addListener(() { if (_aliasFocus.hasFocus) SystemChannels.textInput.invokeMethod('TextInput.show'); });
    _emailFocus.addListener(() { if (_emailFocus.hasFocus) SystemChannels.textInput.invokeMethod('TextInput.show'); });
    _passwordFocus.addListener(() { if (_passwordFocus.hasFocus) SystemChannels.textInput.invokeMethod('TextInput.show'); });
  }

  @override
  void dispose(){
    _name.dispose();
    _alias.dispose();
    _email.dispose();
    _passowrd.dispose();
    _nameFocus.dispose();
    _aliasFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  bool estado = true;

  double _roundedInset(BuildContext context, {double step = 20.0}) {
    final v = MediaQuery.of(context).viewInsets.bottom;
    return (v / step).roundToDouble() * step;
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Usamos valores relativos para mejorar el layout en diferentes pantallas
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                padding: EdgeInsets.only(bottom: _roundedInset(context)),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                      border: Border.all(width: 2, color: ThemeApp.dorado),
                      borderRadius: BorderRadius.circular(size.width * 0.175),
                      color: const Color.fromARGB(255, 30, 20, 0),
                    ),
                  ),
                  Container(
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
                    //nombre de usuario
                    SizedBox(
                      width: size.width * 0.9,
                      child: TextFormField(
                        style: TextStyle(
                          color: ThemeApp.dorado,
                          fontWeight: FontWeight.w300,
                        ),
                        controller: _name,
                        focusNode: _nameFocus,
                        cursorColor: ThemeApp.dorado,
                        decoration: InputDecoration(
                          label: Row(
                            children: const [
                              Icon(Icons.person, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Nombre de usuario',
                                  style: TextStyle(color: Colors.grey)),
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

                    //Alias del usuario
                    SizedBox(
                      width: size.width * 0.9,
                      child: TextFormField(
                        style: TextStyle(
                          color: ThemeApp.dorado,
                          fontWeight: FontWeight.w300,
                        ),
                        controller: _alias,
                        focusNode: _aliasFocus,
                        cursorColor: ThemeApp.dorado,
                        decoration: InputDecoration(
                          label: Row(
                            children: const [
                              Icon(Icons.alternate_email, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Alias',
                                  style: TextStyle(color: Colors.grey)),
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
                        style: TextStyle(
                          color: ThemeApp.dorado,
                          fontWeight: FontWeight.w300,
                        ),
                        controller: _email,
                        focusNode: _emailFocus,
                        cursorColor: ThemeApp.dorado,
                        decoration: InputDecoration(
                          label: Row(
                            children: const [
                              Icon(Icons.email, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Correo electrónico',
                                  style: TextStyle(color: Colors.grey)),
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
                        style: TextStyle(
                          color: ThemeApp.dorado,
                          fontWeight: FontWeight.w300,
                        ),
                        obscureText: estado,
                        controller: _passowrd,
                        focusNode: _passwordFocus,
                        cursorColor: ThemeApp.dorado,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                estado = !estado;
                              });
                            },
                            icon: Icon(
                              estado ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                          label: Row(
                            children: const [
                              Icon(Icons.key, color: Colors.grey),
                              SizedBox(width: 10),
                              Text('Contraseña',
                                  style: TextStyle(color: Colors.grey)),
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
                        onPressed: () async{
                          // Navigator.pushReplacementNamed(context, '/inicio');
                          var respuesta = await Provider.of<ProviderWeb>(context,listen: false).registerWeb(_name.text,_alias.text, _email.text, _passowrd.text);
                          if(respuesta == true){
                            print("Cuenta creada correctamente_____-");
                            Navigator.pushReplacementNamed(context, '/inicio');
                          }else{
                            print("Error");
                          }
                        },
                        style: ButtonStyle().copyWith(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => ThemeApp.dorado,
                          ),
                          shape: WidgetStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Text(
                          'Registrarse',
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: const Color.fromARGB(255, 8, 5, 0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿ya tienes cuenta?",
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ButtonStyle().copyWith(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      'Inicia sesion',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: ThemeApp.dorado,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
            },
          ),
        ),
      ),
    );
  }
}

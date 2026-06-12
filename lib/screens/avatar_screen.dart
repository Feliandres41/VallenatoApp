import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallenato/providers/provider_web.dart';
import 'package:vallenato/themes/theme_app.dart';
import 'package:vallenato/widgets/notificacion_widget.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  bool avatar = false;
  String image_path = "";
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final largo = MediaQuery.of(context).size.height;
    final dorado = ThemeApp.dorado;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Avatares",
          style: TextStyle(
            fontSize: ancho * 0.08,
            color: dorado,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "hombre",
                    style: TextStyle(
                      color: dorado,
                      fontSize: ancho * 0.06,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "mujer",
                    style: TextStyle(
                      color: dorado,
                      fontSize: ancho * 0.06,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: largo * 0.02),
          Consumer<ProviderWeb>(
            builder: (context, value, child) {
              final hombres = value.listaHombres;
              final mujer = value.listaMujeres;
              // final prueba = value.buscarImagen("hombre_1.png");
              // print("___$prueba");
              return hombres.isNotEmpty && mujer.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: hombres.length,
                        itemBuilder: (context, index) {
                          final datosHombre = hombres[index]["name"] ?? '';
                          final datosMujeres = mujer[index]["name"] ?? '';
                          final imagenHombre =
                              'https://zwhtbuwayehcdpsvwpzf.supabase.co/storage/v1/object/public/imagenes/hombre/$datosHombre';
                          final imagenMujer =
                              'https://zwhtbuwayehcdpsvwpzf.supabase.co/storage/v1/object/public/imagenes/mujer/$datosMujeres';
                          return Padding(
                            padding: EdgeInsets.only(bottom: largo * 0.04),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: ancho * 0.025,
                                      right: ancho * 0.015,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          avatar = true;
                                        });
                                        image_path = datosHombre;
                                        print(image_path);
                                      },
                                      child: Container(
                                        width: ancho * 0.5,
                                        height: largo * 0.19,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(imagenHombre),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: ancho * 0.015,
                                      right: ancho * 0.03,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          avatar = true;
                                        });
                                        image_path = datosMujeres;
                                        print(image_path + avatar.toString());
                                      },
                                      child: Container(
                                        width: ancho * 0.4,
                                        height: largo * 0.19,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(imagenMujer),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
            },
          ),
        ],
      ),
      bottomNavigationBar: avatar == false
          ? SizedBox()
          : Container(
              width: double.infinity,
              height: largo*0.08,
              color: Color.fromARGB(255, 122, 84, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async{
                      bool respuesta = await Provider.of<ProviderWeb>(context,listen: false).guardarImagenPerfil("$image_path");
                      if(respuesta==true){
                        NotificacionWidget.mostrarMensaje(context, "Avatar agregado con exito", Colors.green);
                        Navigator.pushReplacementNamed(context, "/inicio");
                      }
                    },
                    child: Text("Continuar",style: 
                      TextStyle(
                        fontSize: ancho*0.05,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ]),
            ),
    );
  }
}

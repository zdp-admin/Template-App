//import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:template/utils/preference_user.dart';
import 'package:template/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';

class NoticeOfPrivacityPage extends StatefulWidget {
  @override
  NoticeOfPrivacityState createState() => new NoticeOfPrivacityState();
}

class NoticeOfPrivacityState extends State<NoticeOfPrivacityPage> {
  PreferencesUser pref = new PreferencesUser();

  @override
  void initState() {
    this.pref.activeRoute = 'notice-privacity';
    super.initState();
  }

  bool showHamburgerMenu() {
    var _show = false;
    if (this.pref.logged) {
      _show = true;
    }

    return _show;
  }

  double widthImage(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 8;
    return width > 500 ? 500 : width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color.fromRGBO(247, 236, 122, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Aviso de privacidad'),
        automaticallyImplyLeading: showHamburgerMenu(),
      ),
      drawer: drawerCustom(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Image(
                    image: AssetImage('assets/images/YourLogoHere1.png'),
                    width: widthImage(context)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '''Lorem Ipsum''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '''Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '''There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...''',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      /*
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Aviso de privacidad',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
            if (this.pref.logged) ...[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  this.pref.noticeOfPrivacy,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ] else ...[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '''NatureSweet Limited («NatureSweet LTD») reconoce la obligación de cumplir con los estándares de integridad de sus visitantes en línea. Hemos desarrollado ciertas prácticas de privacidad para mantener estos estándares y cumplir con las leyes, reglas y regulaciones aplicables incluyendo la Children’s Online Privacy Practices Act (“COPPA” por sus siglas en inglés). Para cualquier duda o comentario acerca del sitio o de las políticas de privacidad, favor de contactar al Servicio al Cliente de NatureSweet LTD, al 1-800-315-8209 de lunes a viernes de 9:00 a.m. hasta 4:30 p.m. (hora del centro).''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '''NatureSweet LTD no requiere información personal de sus visitantes para entrar al sitio, pero sí la requiere para que los visitantes puedan registrarse a promociones específicas o participar en ciertos programas, encuestas, boletines y otras transacciones o actividades en línea. En una página específica de NatureSweet para registro, podemos pedir la fecha de nacimiento, género, dirección de correo electrónico, e información demográfica del visitante. Durante el proceso de registro, NatureSweet LTD calcula la edad del visitante por su fecha de nacimiento. NatureSweet LTD no reúne información personal de niños menores de 13 años en este sitio. NatureSweet LTD se reserva el derecho de limitar la participación, particularmente en programas o promociones a visitantes mayores de 18 años.''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '''NatureSweet LTD utiliza información enviada por sus visitantes para mantener un récord de su participación en nuestras promociones y programas, para responder preguntas y comentarios, para notificar al visitante que es posible ganador de una promoción, para enviar mensajes especiales acerca de nuestro sitio, productos, programas o promociones, para dar a nuestros visitantes acceso especial a secciones especiales de nuestro sitio, y para propósitos internos.''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '''NatureSweet LTD no vende, renta o comparte información personal de nuestros visitantes a terceros para propósitos de mercadeo. NatureSweet LTD puede compartir información personal para cumplir con algún citatorio legal o proceso de ley. Podemos contratar compañías en las que confiamos para que nos ayuden con nuestros sitios, programas y promociones, y esas compañías pueden tener acceso limitado a información personal con el solo propósito de llevar acabo su servicio, sujetos a obligaciones de confidencialidad. Durante promociones conjuntas, los visitantes tendrán la opción de enviar su información personal y/o recibir comunicaciones futuras de nuestro socio en la promoción. Si los visitantes optan por compartir su información con terceros, NatureSweet LTD no se hace responsable por el contenido o uso de información por parte del tercero. Si has optado por participar en una promoción o programa de NatureSweet LTD y/o recibir información de nosotros, podrás cancelar tu registro y eliminar tu información de nuestras bases de datos “anulando tu cuenta” usando los enlaces en una de nuestras comunicaciones que te enviamos, o escribiendo a Servicio al Cliente de NatureSweet LTD a la dirección mencionada arriba.''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  '''NatureSweet LTD también puede reunir información no personal de nuestros visitantes en línea, tales como su tipo de navegador, su sistema operacional y nombres de dominios. La información no personal que reunimos nos ayuda a mantener récord del número total de visitantes en cada uno de nuestros sitios, el cual es utilizado por NatureSweet LTD para mejorar y actualizar nuestros sitios acumulados, productos y servicios. La información acumulada (no personal) puede ser compartida con terceros. Si los visitantes nos envían cualquier comentario, sugerencia, ideas, conceptos, conocimiento o técnicas, NatureSweet LTD es libre de usarlos en todo el mundo, en perpetuidad, sin conocimiento o compensación, con cualquier propósito, incluyendo desarrollos, manufactura y/o mercadeo de productos y/o actualizar o modificar nuestro(s) sitio(s). Esta política de privacidad puede ser modificada por NatureSweet LTD en cualquier momento, solo actualizando este texto. Te recomendamos revisar periódicamente las Políticas de Privacidad.''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ]
          ],
        ),
      ),
      */
    );
  }
}

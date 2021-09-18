import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_site_academia/widgets/responsive.dart';

import 'bottom_bar_column.dart';
import 'info_text.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? buildColumnMobile()
          : buildColumnWEB(),
    );
  }

  Column buildColumnWEB() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomBarAbout(),
            //buildBottomBarFaq(),
            buildBottomBarFacebook(),
            Container(
              color: Colors.blueGrey,
              width: 2,
              height: 150,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoTextEmail(),
                // SizedBox(height: 5),
                // buildInfoAdrress(),
                SizedBox(height: 5),
                buildInfoTel(),
                SizedBox(height: 5),
                buildInfoWhatsapp(),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildContainerLine(),
        ),
        SizedBox(height: 20),
        buildTextCopyright(),
      ],
    );
  }

  Column buildColumnMobile() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomBarAbout(),
           // buildBottomBarFaq(),
            buildBottomBarFacebook(),
          ],
        ),
        buildContainerLine(),
        SizedBox(height: 20),
        buildInfoTextEmail(),
        // SizedBox(height: 5),
        // buildInfoAdrress(),
        SizedBox(height: 5),
        buildInfoTel(),
        SizedBox(height: 5),
        buildInfoWhatsapp(),
        SizedBox(height: 20),
        buildContainerLine(),
        SizedBox(height: 20),
        buildTextCopyright(),
      ],
    );
  }

  Container buildContainerLine() {
    return Container(
      color: Colors.blueGrey,
      width: double.maxFinite,
      height: 1,
    );
  }

  Widget buildTextCopyright() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => mapLocale(
            "https://www.google.com/maps/place/R.+Sete+Lagoas,+5+-+Conj.+Hab.+Pres.+Castelo+Branco,+Carapicu%C3%ADba+-+SP,+06328-140/@-23.5269505,-46.8206613,3a,75y,168.75h,96.41t/data=!3m6!1e1!3m4!1s-Q2pVtEY2d-W4a_Am4yGFw!2e0!7i16384!8i8192!4m5!3m4!1s0x94cefe28adf50087:0x59edd375261c8199!8m2!3d-23.5271861!4d-46.820603"),
        child: InfoText(
          type: 'Endereço',
          text: 'Rua Sete Lagos, 05 - Cohab 2 - Carapicuiba - SP - 06328-140',
        ),
      ),
    );
  }

  Widget buildInfoAdrress() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => mapLocale(
            "https://www.google.com/maps/place/R.+Sete+Lagoas,+5+-+Conj.+Hab.+Pres.+Castelo+Branco,+Carapicu%C3%ADba+-+SP,+06328-140/@-23.5269505,-46.8206613,3a,75y,168.75h,96.41t/data=!3m6!1e1!3m4!1s-Q2pVtEY2d-W4a_Am4yGFw!2e0!7i16384!8i8192!4m5!3m4!1s0x94cefe28adf50087:0x59edd375261c8199!8m2!3d-23.5271861!4d-46.820603"),
        child: InfoText(
          type: 'Endereço',
          text: 'Rua Sete Lagos, 05 - Cohab 2 - Carapicuiba - SP - 06328-140',
        ),
      ),
    );
  }

  Widget buildInfoTel() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => fazerLigacao(),
        child: InfoText(
          type: 'Telefone: ',
          text: '(11) 4184-4742',
        ),
      ),
    );
  }

  Widget buildInfoWhatsapp() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openWhatsApp("5511992747939"),
        child: InfoText(
          type: 'Whatsapp: ',
          text: '(11) 9 9274-7939',
        ),
      ),
    );
  }

  openWhatsApp(String cell) async {
      var whatsappUrl = "whatsapp://send?web=+$cell&text=Olá,tudo bem ?";
      if (await canLaunch(whatsappUrl)) {
        abrirWhatsApp(whatsappUrl);
      }else{
        var whatsappUrl = "https://wa.me/$cell/?text=Olá,tudo bem?";
        if (await canLaunch(whatsappUrl)) {
          abrirWhatsApp(whatsappUrl);
        }else{
          throw 'Could not launch $whatsappUrl';
        }
      }
  }

  abrirWhatsApp(String whatsappUrl) async {
    await launch(whatsappUrl);
  }

  void fazerLigacao() async {
    const url = "tel:1141844742";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildInfoTextEmail() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => getEmail("fale@galpao21.com"),
        child: InfoText(
          type: 'Email',
          text: 'fale@galpao21.com',
        ),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  getEmail(String email) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{'subject': 'Pergunta!'}),
    );
    launch(emailLaunchUri.toString());
  }

  Widget buildBottomBarFacebook() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: BottomBarColumn(
        heading: 'SOCIAL',
        s1: 'Instagram',
        link1: "https://www.instagram.com/academiagalpao21/?hl=pt-br",
        s2: 'Facebook',
        link2: "https://pt-br.facebook.com/AcademiaGalpao21/",
        s3: '',
      ),
    );
  }

  BottomBarColumn buildBottomBarFaq() {
    return BottomBarColumn(
      heading: 'REFERENCIA',
      s1: 'Atacadão',
      s2: 'Parque dos Paturis',
      s3: '',
    );
  }

  BottomBarColumn buildBottomBarAbout() {
    return BottomBarColumn(
      heading: 'FUNCIONAMENTO',
      s1: 'Segunda a Sexta 6:00h às 23:00h',
      s2: 'Sabado das 8:00h ao 14:00h',
      s3: '',
    );
  }

  mapLocale(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

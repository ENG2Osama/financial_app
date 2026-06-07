import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class mothedContactUs {
  Future<void> ContectEmail() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'engosama11111@gmail.com',
      query: 'subject=Welcome&body=I would like to inquire',
    );


      await launchUrl(email);

  }Future<void> ContectPhone() async {
    final Uri phone = Uri.parse(
      'tel:+967778972159',
    );

      await launchUrl(phone);

  }
  Future<void> ContectWhatsapp() async {
    final Uri Whatsapp=Uri.parse(
      'https://wa.me/967778972159'
    );
    await launchUrl(Whatsapp,mode: LaunchMode.externalApplication);


  }
}
 import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';

class ComunicationIcons extends StatelessWidget {
  const ComunicationIcons({
    Key? key,
    required this.url,
    required this.icondata,
      this.isCall = false,
  }) : super(key: key);

  final String url;
  final bool? isCall;
  final IconData icondata;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        if (isCall!) {
          await canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
            if (result) {
               launchUrl(Uri(scheme: 'tel', path: '967$url'));
            }
          });
        } else if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
        } else {
          // throw 'Could not launch $url';
        
        }
      },
      icon: Icon(icondata), 
    );
  }
}

import 'package:about/comunication_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String applicationVersion = '0.0.2';
String applicationNameAr = '‏تطبيق';
String applicationNameEn = 'My App';
String phone = '7300000';
Future showAboutAppDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '$applicationVersion $applicationNameAr',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo.jpeg',
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '©$applicationNameEn ${DateTime.now().year}',
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ComunicationIcons(
                      url: 'http://app.com', icondata: FontAwesomeIcons.chrome),
                  const ComunicationIcons(
                      url:
                          'mailto:mailto:ahfad@gmail.com?subject= استفسار بخصوص&body= يرجى كتابة الاستفسار الذي تريد',
                      icondata: Icons.mail),
                  ComunicationIcons(
                      url: TargetPlatform.android == Theme.of(context).platform
                          ? "https://wa.me/$phone"
                          : "https://api.whatsapp.com/send?phone=$phone",
                      icondata: Icons.whatsapp),
                  ComunicationIcons(
                    isCall: true,
                    url: phone,
                    icondata: Icons.call,
                  ),
                  const ComunicationIcons(
                      url: 'https://instagram.com/',
                      icondata: FontAwesomeIcons.instagram),
                ],
              ),
              const Text(
                'تطبيق جميل ورائع يمكنك من البحث بكل سهولة',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('رجوع'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

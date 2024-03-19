import 'package:bizcotap/utils/app_exports.dart';

void openLink(String website) async {
  String link = website;
  if (await launchUrlString(link)) {
    await launchUrlString(link);
  } else {
    throw 'Could not launch $link';
  }
}

void emailLauncher(String content, String subject, String emailAddress) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    queryParameters: <String, String>{
      'subject': Uri.encodeComponent(subject),
      'body': Uri.encodeComponent(content),
    },
  );
  if (!await launchUrlString(emailLaunchUri.toString())) {
    throw Exception('Could not launch email');
  }
}

Future<void> launchSMS(String phoneNumber, String body) async {
  final String uri = 'sms:$phoneNumber?body=${Uri.encodeComponent(body)}';

  if (await canLaunchUrlString(uri)) {
    await launchUrlString(uri);
  } else {
    throw 'Could not launch SMS';
  }
}

void openWhatsApp(String phoneNumber) async {
  String whatsapp = "https://wa.me/$phoneNumber";
  if (await launchUrlString(whatsapp.toString())) {
    await launchUrlString(whatsapp);
  } else {
    throw 'Could not launch $whatsapp';
  }
}

import 'package:bookia/Core/Utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? link) async {
  if (link != null) {
    Uri url = Uri.parse(link);
    if (!await canLaunchUrl(url)) {
      customSnackBar(context, text: 'Cannot launch $link');
    } else {
      launchUrl(
        url,
      );
    }
  }
}

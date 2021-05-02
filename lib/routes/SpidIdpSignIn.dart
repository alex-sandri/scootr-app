import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/SpidIdentityProvider.dart';
import 'package:scootr/routes/Map.dart';
import 'package:scootr/services/Auth.dart';
import 'package:scootr/widgets/AppBar.dart';

class SpidIdpSignInRoute extends StatelessWidget {
  final SpidIdentityProvider idp;

  SpidIdpSignInRoute({
    required this.idp,
  });

  @override
  Widget build(BuildContext context) {
    final CookieManager cookieManager = CookieManager.instance();

    return Scaffold(
      appBar: ScootrAppBar(
        title: "SPID - ${idp.name}",
      ),
      body: FutureBuilder<bool>(
        future: () async {
          await cookieManager.deleteAllCookies();

          return true;
        }(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse("${Config.SPID_ENDPOINT}/signin.php?idp=${idp.id}"),
            ),
            onUpdateVisitedHistory: (controller, url, androidIsReload) async {
              final sessionIdCookie = await cookieManager.getCookie(
                url: Uri.parse("https://localhost:4200"),
                name: "session_id",
              );

              if (sessionIdCookie != null)
              {
                await Hive.box("auth").put("sessionId", sessionIdCookie.value);
                await cookieManager.deleteAllCookies();

                await Provider.of<AuthService>(context, listen: false).signIn();
              }
            },
          );
        }
      ),
    );
  }
}
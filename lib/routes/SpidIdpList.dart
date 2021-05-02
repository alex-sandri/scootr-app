import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:scootr/config/Config.dart';
import 'package:scootr/widgets/AppBar.dart';

class SpidIdpListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CookieManager cookieManager = CookieManager.instance();

    return Scaffold(
      appBar: ScootrAppBar(),
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

          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Text(
                "Seleziona il tuo Identity Provider",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final identityProvider in Config.SPID_IDENTITY_PROVIDERS)
                    Container(
                      width: ((MediaQuery.of(context).size.width - 20) * 0.5) - 5,
                      child: TextButton(
                        child: SvgPicture.asset(
                          "assets/images/spid/${identityProvider.id}.svg",
                          height: 25,
                          placeholderBuilder: (_) => Text(identityProvider.name),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => InAppWebView(
                                initialUrlRequest: URLRequest(
                                  url: Uri.parse("${Config.SPID_ENDPOINT}/signin.php?idp=${identityProvider.id}"),
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

                                    print(sessionIdCookie.value);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shopapp/modules/shop_app/on_boarding/login/login_screen.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: TextButton(
          onPressed: () {
            CacheHelper.removeData(key: "token").then((value) => {
                  if (value) {navigateAndFinish(context, ShopLoginScreen())}
                });
          },
          child: Text("Sign Out")),
    );
  }
}

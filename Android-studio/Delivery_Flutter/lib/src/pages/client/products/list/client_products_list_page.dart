import 'package:delivery_flutter/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            Text('Client Product list'),
            ElevatedButton(
              onPressed:()=>con.signOut(),
              child: Text('Cerrar sesion',
                style:TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

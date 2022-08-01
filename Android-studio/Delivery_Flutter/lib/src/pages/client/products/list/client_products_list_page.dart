import 'package:delivery_flutter/src/models/category.dart';
import 'package:delivery_flutter/src/models/product.dart';
import 'package:delivery_flutter/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:delivery_flutter/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:delivery_flutter/src/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_animated_bottom_bar.dart';
import '../../../delivery/orders/delivery_orders_list.dart';

import '../../../restaurant/orders/list/restaurant_orders_list_page.dart';

class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {

    return  Obx(()=>DefaultTabController(
      length: con.categories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(110),
          child:AppBar(
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.topCenter,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  _textFieldSearch(context),
                  _iconShoppingBag()
                ],
              ),
            ),
            bottom:TabBar(
              isScrollable: true,
              indicatorColor: Colors.deepOrange,
              labelColor:Colors.black ,
              unselectedLabelColor:Colors.white,
              tabs: List<Widget>.generate(con.categories.length, (index){
                return Tab(
                  child: Text(con.categories[index].name ?? ''),
                );
              }),

            ),
          ),
        ) ,
          body:TabBarView(
            children: con.categories.map((Category category){
              return FutureBuilder(
                  future: con.getProducts(category.id ?? '1'),
                  builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (_, index) {
                              return _cardProduct(context, snapshot.data![index]);
                            }
                        );
                      }
                      else {
                        return NoDataWidget(text: 'No hay productos');
                      }
                    }
                    else {
                      return NoDataWidget(text: 'No hay productos');
                    }
                  }
              );
            }).toList(),
          )
      ),
    ));
  }

  Widget _iconShoppingBag(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: ()=> con.goToOrderCreate(),
          icon: Icon(
              Icons.shopping_bag_outlined,
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget _textFieldSearch(BuildContext context){
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar Producto',
            suffixIcon: Icon(Icons.search, color: Colors.grey),
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.black12
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey
              )
            ),
          contentPadding:  EdgeInsets.all(15)
          ),
        ),
      ),
    );
  }

  Widget _cardProduct(BuildContext context, Product product) {
    return GestureDetector(
      onTap:()=>con.openBottomSheet(context, product),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15,left: 10,right:10 ),
            child: ListTile(
              title: Text(product.name ?? ''),
              subtitle: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                      product.description??'',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12.5
                      ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$${product.price.toString()}',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 15),

                ],
              ),
             trailing: Container(
               height: 75,
               width: 65,
               child: ClipRRect(
                 borderRadius:BorderRadius.circular(12),
                 child: FadeInImage(
                  image: product.image1!=null
                    ? NetworkImage(product.image1!)
                      :AssetImage('assets/img/no-image.png') as ImageProvider ,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 10),
            placeholder:AssetImage('assets/img/no-image.png'),


                  ),
               ),
             ),
            ),
          ),
          Divider(height: 1,color: Colors.grey,indent: 30,endIndent: 30,)



        ],
      ),
    );

  }


}
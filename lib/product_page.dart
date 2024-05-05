
import 'package:flutter/material.dart';
import 'package:flutter_app_course/form_page.dart';

import 'assets/constant_file.dart';

class ProductPage extends StatelessWidget {
  String name;
  ProductPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          endDrawer: navDrawer(context),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('Daftar Product'),
          ),
          body: Column(
            children: [
              Container(
                child: Text('Hello, $name'),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 7,
                child: ListView.builder(
                  itemCount: listProduct.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: Colors.black)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJHB2LmJDE8mRo5vCggGcP-G5Jkov0nOYt700GGxzzQg&s',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listProduct[index].nameProduct),
                            Text(listProduct[index].priceProduct.toString()),
                            Text(listProduct[index].qtyProduct.toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget navDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          header(),
          dataItem(context, Icon(Icons.home), 'Home', 'Halaman pertama dibuka'),
          dataItem(context, Icon(Icons.book), 'Book', 'Halaman daftar buku')
        ],
      ),
    );
  }

  Widget header() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      accountName: Text(name),
      accountEmail: Text('$name@gmail.com'),
      currentAccountPicture: ClipOval(
        child: Image.network(
            'https://marketplace.canva.com/EAFHfL_zPBk/1/0/1600w/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w.jpg'),
      ),
    );
  }

  Widget dataItem(BuildContext context, Icon icon, String valueTitle,
      String valueSubtitle) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormPage(),
          )),
      leading: icon,
      title: Text(valueTitle),
      subtitle: Text(valueSubtitle),
    );
  }
}
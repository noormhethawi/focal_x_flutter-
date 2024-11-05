import 'package:flutter/material.dart';
import 'package:pro/model/productmodel.dart';

class SearchResultsPage extends StatelessWidget {
  final List<Datum1> products;

  SearchResultsPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()}'),
            leading: Container(
              child: Image.network(product.image),
            ),
          );
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:statemanagementsession/models/product.dart';

class ApiRepo {
  final Dio client;

  ApiRepo({this.client});

  Future<ProductList> getProducts() async {
    Response response;

    try {
      response = await client.get(
          'https://run.mocky.io/v3/188d9248-9464-4241-ba24-e2da025f373e?fbclid=IwAR0IbVcKbSfdZwMfTX0s9vjM-BGP0XvnJJzCqtEZzpX7DrKYRgCL5WKDnyg');
    } catch (e) {
      print('e: $e');
    }

    ProductList products = ProductList.fromJson(response.data);

    print('products: ${products.toString()}');

    return products;
  }
}

import 'package:block_flow/app/app.dart';
import 'package:block_flow/bootstrap.dart';

void main() {
  bootstrap((result) {
    return App(serviceLocator: result.serviceLocator);
  });
}

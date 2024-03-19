import 'package:bizcotap/data/model/payment_methods_data.dart';
import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/invoices/payment_method_tile.dart';

class PaymentMethodList extends StatelessWidget {
  const PaymentMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: methodsDataList
            .map((item) => PaymentMethodTile(data: item))
            .toList(),
      ),
    );
  }
}

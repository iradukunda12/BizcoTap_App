import 'package:bizcotap/data/model/my_invoice_data.dart';
import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/invoices/invoice_tile.dart';

class InvoiceList extends StatelessWidget {
  const InvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: invoicesDataList.length,
      itemBuilder: (context, index) {
        // Get the current invoice from the list
        Invoice currentInvoice = invoicesDataList[index];

        return MyinvoiceTile(
          data: currentInvoice,
        );
      },
    );
  }
}
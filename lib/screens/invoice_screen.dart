import 'package:bizcotap/utils/app_exports.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final ScreenshotController _controller = ScreenshotController();

  Future<void> _captureAndShare() async {
    Uint8List? imageBytes = await _controller.capture();

    if (imageBytes != null) {
      try {
        // Create a PDF document
        final pdf = pw.Document();

        // Add the image to the PDF
        final image = pw.MemoryImage(imageBytes);
        pdf.addPage(pw.Page(build: (pw.Context context) {
          return pw.Center(child: pw.Image(image));
        }));

        // Save the PDF to a temporary directory
        final tempDir = await getTemporaryDirectory();
        final tempPath = '${tempDir.path}/invoice.pdf';
        final file = File(tempPath);
        await file.writeAsBytes(await pdf.save());

        // Share the PDF file
        await Share.shareXFiles([XFile(tempPath)], text: 'Great document');
      } catch (e) {
        //
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Invoice',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        MyIconButton(
          icon: Icons.ios_share_outlined,
          tooltip: 'Share',
          onPressed: _captureAndShare,
          size: getSizeByScreenWidth(context, 6.5),
        ),
      ],
      body: Screenshot(
        controller: _controller,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppConstants.invoiveimage,
                      ),
                      alignment: Alignment.topCenter),
                ),
              ),
            ),
            MySizedBox(
              height: 76,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Invoice paid',
                    fontWeight: FontWeight.bold,
                    fontSize: getSizeByScreenWidth(context, 7),
                  ),
                  const MySizedBox(
                    height: 3,
                  ),
                  MyText(
                    text: '\$100',
                    fontWeight: FontWeight.bold,
                    fontSize: getSizeByScreenWidth(context, 12),
                    textAlign: TextAlign.center,
                  ),
                  const MySizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSizeByScreenWidth(context, 17),
                    ),
                    child: MyText(
                      text:
                          'We’ve fetched the details from your bill. Please verify the details',
                      textAlign: TextAlign.center,
                      color: AppColors.lightDark.withOpacity(0.6),
                    ),
                  ),
                  const MySizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      height: 20,
                      color: AppColors.lighterDark.withOpacity(0.3),
                    ),
                  ),
                  const MySizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getSizeByScreenWidth(context, 51.5),
                    ),
                    child: MyText(
                      text: 'Invoice number',
                      fontSize: getSizeByScreenWidth(context, 3),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: getSizeByScreenWidth(
                              context,
                              13.5,
                            ),
                            top: getSizeByScreenHeight(context, 2)),
                        child: const MyText(
                          text: '5C1C4E40-0009',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const MySizedBox(
                        width: 18,
                      ),
                      const Image(image: AssetImage(AppConstants.qrscan))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getSizeByScreenWidth(context, 10),
                      right: getSizeByScreenWidth(context, 10),
                    ),
                    child: Divider(
                      thickness: getSizeByScreenWidth(context, 0.4),
                      color: AppColors.lighterDark.withOpacity(0.2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getSizeByScreenWidth(context, 51.5),
                    ),
                    child: MyText(
                      text: 'Payment date',
                      fontSize: getSizeByScreenWidth(context, 3),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: getSizeByScreenWidth(
                              context,
                              13.5,
                            ),
                            top: getSizeByScreenHeight(context, 2)),
                        child: const MyText(
                          text: '20 Sep 2023',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const MySizedBox(
                        width: 18,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getSizeByScreenWidth(context, 10),
                      right: getSizeByScreenWidth(context, 10),
                    ),
                    child: Divider(
                      thickness: getSizeByScreenWidth(context, 0.4),
                      color: AppColors.lighterDark.withOpacity(0.2),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getSizeByScreenWidth(context, 51.5),
                    ),
                    child: MyText(
                      text: 'Payment method',
                      fontSize: getSizeByScreenWidth(context, 3),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: getSizeByScreenWidth(
                              context,
                              13.5,
                            ),
                            top: getSizeByScreenHeight(context, 2)),
                        child: MyText(
                          text: 'Visa...3090',
                          fontSize: getSizeByScreenWidth(context, 4.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const MySizedBox(
                        width: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getSizeByScreenWidth(context, 6.5),
                            top: getSizeByScreenHeight(context, 1)),
                        child: Row(
                          children: [
                            MyText(
                              text: 'INV',
                              fontSize: getSizeByScreenWidth(context, 6),
                            ),
                            SizedBox(
                              width: getSizeByScreenWidth(context, 3.5),
                              child: const Image(
                                image: AssetImage(AppConstants.bolt),
                              ),
                            ),
                            MyText(
                              text: '001',
                              fontSize: getSizeByScreenWidth(context, 6),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

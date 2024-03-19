import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/commons/my_dash_border.dart';

class UplaodImageLogo extends StatefulWidget {
  const UplaodImageLogo({
    super.key,
    required this.onLogoselected,
  });

  final Function(File?) onLogoselected;

  @override
  State<UplaodImageLogo> createState() => _UplaodImageLogoState();
}

class _UplaodImageLogoState extends State<UplaodImageLogo> {
  File? editedLogoFile;
  double scaleFactor = 1.0;

  Future<void> selectLogoImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final File logoFile = File(image.path);

      if (_isValidImageFile(logoFile)) {
        setState(() {
          editedLogoFile = logoFile;
        });

        widget.onLogoselected(editedLogoFile);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Invalid file format. Please choose a PNG or GIF file.'),
        ));
      }
    }
  }

  bool _isValidImageFile(File file) {
    final List<String> allowedExtensions = ['png', 'GIF'];

    final String extension = file.path.split('.').last.toLowerCase();

    return allowedExtensions.contains(extension);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSizeByScreenHeight(context, 12.5),
      width: double.infinity,
      child: CustomPaint(
        painter: MyDashedBorder(
          color: const Color.fromARGB(166, 166, 166, 166),
          borderRadius: 10,
          strokeWidth: 2.0,
          dashWidth: 6.0,
          dashSpace: 4.0,
        ),
        child: GestureDetector(
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              scaleFactor = details.scale;
            });
          },
          onTap: selectLogoImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MySvg(assetName: AppConstants.imageIconSvg),
              SizedBox(height: getSizeByScreenHeight(context, 0.5)),
              MyText(
                text: 'Upload the Logo',
                fontSize: getSizeByScreenWidth(context, 4),
                fontWeight: FontWeight.bold,
              ),
              MyText(
                text: 'upload only PNG or GIF',
                fontSize: getSizeByScreenWidth(context, 3.4),
                color: AppColors.lighterDark,
              ),
              MyText(
                text: '1177 x 562px image for best results',
                fontSize: getSizeByScreenWidth(context, 3.4),
                color: AppColors.lighterDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

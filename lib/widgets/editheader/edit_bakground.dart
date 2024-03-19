import 'package:bizcotap/utils/app_exports.dart';

class EditBackground extends StatefulWidget {
  const EditBackground({
    super.key,
    required this.onImageSelected,
  });

  final Function(File?) onImageSelected;

  @override
  State<EditBackground> createState() => _EditBackgroundState();
}

class _EditBackgroundState extends State<EditBackground> {
  File? editedBackgroundImageFile;
  File? editedLogoFile;

  Future<void> selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final File imageFile = File(image.path);
      setState(() {
        editedBackgroundImageFile = imageFile;
      });

      widget.onImageSelected(editedBackgroundImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: getSizeByScreenWidth(context, 4),
        top: getSizeByScreenHeight(context, 0),
        child: GestureDetector(
          onTap: selectProfileImage,
          child: Container(
            height: getSizeByScreenHeight(context, 7),
            width: getSizeByScreenWidth(context, 10.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: getSizeByScreenHeight(context, 0.5),
                  color: AppColors.background),
              color: AppColors.primary,
            ),
            child: Padding(
              padding: EdgeInsets.all(getSizeByScreenHeight(context, 1.2)),
              child: const MySvg(assetName: AppConstants.editSvg),
            ),
          ),
        ));
  }
}

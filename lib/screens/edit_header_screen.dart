// ignore_for_file: avoid_print

import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/editheader/color_picker.dart';

class EditHeaderScreen extends StatefulWidget {
  const EditHeaderScreen({
    super.key,
  });

  @override
  State<EditHeaderScreen> createState() => _EditHeaderScreenState();

  void onImageSelected(File imageFile) {}
}

class _EditHeaderScreenState extends State<EditHeaderScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedImagePath;
  File? selectedImage;
  Color selectedColor = Colors.red;
  late final (File?,) onImageSelected;

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      print('Saving profile...');
      bool saveSuccess = true;

      if (saveSuccess) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MaterialAlertDialog(
              title: '',
              content: 'You have successfully saved and edited your header',
              onPressed: () {
                Navigator.pop(context);
              },
              customImage: const MySvg(
                assetName: AppConstants.successSvg,
              ),
            );
          },
        );
      }
    }
  }

  void handleImageSelected(File? imageFile) {
    if (imageFile != null && mounted) {
      setState(() {
        selectedImagePath = imageFile.path;
      });
      widget.onImageSelected(imageFile);
    }
  }

  void _previewProfile() {
    print('Previewing profile...');
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Edit header',
        fontSize: getSizeByScreenWidth(context, 5),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Column(
        children: [
          SimpleColorPicker(
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
              });
            },
            onImageSelected: (imageFile) {
              handleImageSelected(imageFile);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MyOutlinedButton(
                    onPressed: _previewProfile,
                    text: const MyText(
                      text: 'Preview',
                      color: AppColors.primary,
                    ),
                    buttonColor: const MaterialStatePropertyAll(
                      AppColors.light,
                    ),
                    borderColor: AppColors.primary,
                  ),
                ),
                SizedBox(
                  width: getSizeByScreenWidth(context, 1.5),
                ),
                Expanded(
                  child: MyOutlinedButton(
                    onPressed: _saveProfile,
                    text: const MyText(
                      text: 'Save',
                      color: AppColors.background,
                    ),
                    buttonColor: const MaterialStatePropertyAll(
                      AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

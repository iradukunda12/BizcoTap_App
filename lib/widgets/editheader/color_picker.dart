import 'dart:math';
import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/editheader/edit_bakground.dart';
import 'package:bizcotap/widgets/editheader/my_slider.dart';
import 'package:bizcotap/widgets/editheader/uplaod_img_container.dart';

class SimpleColorPicker extends StatefulWidget {
  final Function(Color) onColorChanged;

  const SimpleColorPicker({
    super.key,
    required this.onColorChanged,
    required this.onImageSelected,
    this.onLogoSelected,
  });
  final Function(File?) onImageSelected;
  final Function(File?)? onLogoSelected;

  @override
  SimpleColorPickerState createState() => SimpleColorPickerState();
}

class SimpleColorPickerState extends State<SimpleColorPicker> {
  late Color selectedColor;

  String? selectedBackgroundImagePath;
  String? selectedLogoPath;
  File? editedLogoFile;
  late Offset editedLogoPosition = const Offset(100, 50);
  double indicatorPosition = 0.0;
  double opacityValue = 1.0;

  GlobalKey imageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Initial color (you can set it to any default color)
    selectedColor = Colors.red;
    editedLogoPosition = const Offset(100, 50); // Adjust these values as needed
  }

  void updateColor(double position) {
    double gradientPosition = position / MediaQuery.of(context).size.width;
    gradientPosition = gradientPosition.clamp(0.0, 1.0);
    double angle = gradientPosition * 2 * pi;
    setState(() {
      Color gradientColor =
          HSVColor.fromAHSV(1.0, angle * 180 / pi, 1.0, 1.0).toColor();

      selectedColor = gradientColor.withOpacity(opacityValue);

      widget.onColorChanged(selectedColor);
    });
  }

  void handleImageSelected(File? imageFile) {
    if (imageFile != null && mounted) {
      setState(() {
        selectedBackgroundImagePath = imageFile.path;
      });
      widget.onImageSelected(imageFile);
    }
  }

  void handleLogoSelected(File? logoFile) {
    if (logoFile != null && mounted) {
      setState(() {
        editedLogoFile = logoFile;
      });
    }
  }

  void updateOpacity(double opacity) {
    setState(() {
      opacityValue = opacity;

      selectedColor = selectedColor.withOpacity(opacityValue);

      widget.onColorChanged(selectedColor);
    });
  }

  Color calculateTextColor(Color backgroundColor) {
    double brightness = (backgroundColor.red * 299 +
            backgroundColor.green * 587 +
            backgroundColor.blue * 114) /
        1000;

    return brightness > 128 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.lighterDark.withOpacity(0.1),
          height: getSizeByScreenHeight(context, 25),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  key: imageKey,
                  padding: const EdgeInsets.all(16),
                  height: getSizeByScreenHeight(context, 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: selectedBackgroundImagePath != null
                        ? DecorationImage(
                            opacity: 0.7,
                            image:
                                FileImage(File(selectedBackgroundImagePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: selectedColor.withOpacity(opacityValue),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            calculateTextColor(selectedColor),
                            BlendMode.srcATop,
                          ),
                          child: Image.asset(
                            "assets/commons/whiteLogo.png",
                            height: getSizeByScreenHeight(context, 3),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          if (editedLogoFile != null)
                            Positioned(
                              left: editedLogoPosition.dx,
                              top: editedLogoPosition.dy,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  setState(() {
                                    double newX = editedLogoPosition.dx +
                                        details.delta.dx;
                                    double newY = editedLogoPosition.dy +
                                        details.delta.dy;

                                    newX = newX.clamp(
                                        0, MediaQuery.of(context).size.width);
                                    newY = newY.clamp(
                                        0, MediaQuery.of(context).size.height);

                                    editedLogoPosition = Offset(newX, newY);
                                  });
                                },
                                child: Image.file(
                                  editedLogoFile!,
                                  height: getSizeByScreenHeight(context, 16),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              EditBackground(
                onImageSelected: (imageFile) {
                  handleImageSelected(imageFile);
                },
              ),
              Positioned(
                right: getSizeByScreenWidth(context, 44),
                bottom: getSizeByScreenHeight(context, 0),
                child: Container(
                  height: getSizeByScreenHeight(context, 8),
                  width: getSizeByScreenWidth(context, 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        width: 4, color: AppColors.light, strokeAlign: 0.2),
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: MyText(
                      text: capitalizeInitials('U'),
                      color: AppColors.background,
                      fontSize: getSizeByScreenHeight(context, 4),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getSizeByScreenHeight(context, 2),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              MyText(
                text: "Card color",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onPanUpdate: (details) {
              RenderBox renderBox =
                  imageKey.currentContext!.findRenderObject() as RenderBox;

              Offset localPosition =
                  renderBox.globalToLocal(details.globalPosition);

              setState(() {
                indicatorPosition = localPosition.dx;
              });

              updateColor(localPosition.dx);
            },
            child: Container(
              width: double.infinity,
              height: getSizeByScreenHeight(context, 4),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.indigo,
                    Colors.purple,
                  ],
                  stops: [
                    0.0,
                    0.17,
                    0.33,
                    0.5,
                    0.67,
                    0.83,
                    1.0,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: indicatorPosition - 15,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Color picker
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildColorButton(Colors.black),
              _buildColorButton(const Color(0xff4F4F4F)),
              _buildColorButton(const Color(0xff939393)),
              _buildColorButton(const Color(0xff0165FB)),
              _buildColorButton(const Color(0xff458FFF)),
              _buildColorButton(const Color(0xffA6C9FF)),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              MyText(text: 'Background Transparency'),
            ],
          ),
        ),
        MySlider(
          initialOpacity: opacityValue,
          onOpacityChanged: updateOpacity,
          width: 500,
          height: 40,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyDivider(
                  color: AppColors.lighterDark.withOpacity(0.2),
                ),
              ),
              const MyText(
                text: "or",
                color: AppColors.lighterDark,
              ),
              Expanded(
                child: MyDivider(
                  color: AppColors.lighterDark.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: UplaodImageLogo(
            onLogoselected: (imageFile) {
              handleLogoSelected(imageFile);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
        // Update the color with opacity
        widget.onColorChanged(selectedColor.withOpacity(opacityValue));
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: selectedColor == color
                ? AppColors.primary.withOpacity(0.2)
                : AppColors.lighterDark.withOpacity(0.2),
            width: 5,
            strokeAlign: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

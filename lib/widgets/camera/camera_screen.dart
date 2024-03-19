import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/camera/display_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  String? lastTakenPicturePath;

  int direction = 0;
  late String recognizedText = "";
  bool isLoading = true;

  List<dynamic> emails = [];
  List<dynamic> phoneNumbers = [];
  List<dynamic> names = [];
  List<dynamic> companyNames = [];
  List<dynamic> locations = [];
  List<dynamic> urls = [];
  List<dynamic> jobPositions = [];

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  Future<void> startCamera(int direction) async {
    cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      cameraController = CameraController(
        cameras[direction],
        ResolutionPreset.high,
        enableAudio: false,
      );

      try {
        await cameraController!.initialize();
        if (!mounted) {
          return;
        }

        if (!cameraController!.value.isCaptureOrientationLocked) {
          if (kDebugMode) {
            print('Auto-focus is not supported for this camera.');
          }
        }

        setState(() {});
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (cameraController != null && cameraController!.value.isInitialized) {
          final Offset normalizedOffset = details.localPosition;
          setFocusPoint(normalizedOffset);
        }
      },
      child: buildCameraView(),
    );
  }

  Widget buildCameraView() {
    if (cameraController != null && cameraController!.value.isInitialized) {
      return Stack(
        children: [
          CameraPreview(cameraController!),
          Positioned(
            top: 56.0,
            left: 16.0,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const MyIcon(
                      icon: AppIcons.cancel,
                      size: 30,
                      color: AppColors.light,
                    )),
                SizedBox(width: getSizeByScreenWidth(context, 10)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 350,
              height: 200,
            ),
          ),
          Positioned(
            bottom: 16.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isButtonClicked = true;
                    });
                    _getFromGallery();
                    setState(() {
                      isButtonClicked = false;
                    });
                  },
                  child: const MySvg(assetName: AppConstants.add),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isButtonClicked = true;
                    });

                    final XFile? file = await cameraController?.takePicture();
                    if (file != null) {
                      // Process and extract information from the taken picture
                      processImage(File(file.path));
                    }

                    setState(() {
                      isButtonClicked = false;
                    });
                  },
                  child: const MySvg(
                    assetName: AppConstants.scan,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _toggleFlashlight(cameraController!);
                  },
                  child: const MySvg(assetName: AppConstants.flash),
                )
              ],
            ),
          ),
          if (isButtonClicked)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.8),
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    backgroundColor: Colors.black,
                    semanticsLabel: 'Circular progress indicator',
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
        ],
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 6,
          backgroundColor: Colors.black,
          semanticsLabel: 'Circular progress indicator',
          color: AppColors.primary,
        ),
      );
    }
  }

  Future<void> processImage(File imageFile) async {
    setState(() {
      isButtonClicked = true;
    });

    final InputImage inputImage = InputImage.fromFile(imageFile);
    final textDetector = GoogleMlKit.vision.textRecognizer();

    try {
      final RecognizedText recognisedText =
          await textDetector.processImage(inputImage);
      String extractedText = recognisedText.text;
      if (kDebugMode) {
        print(extractedText);
      }
      await extractEntitiesAndSave(extractedText);
    } catch (e) {
      if (kDebugMode) {
        print("Error during text recognition: $e");
      }
    } finally {
      textDetector.close();
      setState(() {
        isButtonClicked = false;
      });
    }
  }

  Future<void> extractEntitiesAndSave(String extractedText) async {
    final response = await http.post(
      Uri.http('192.168.1.57:5000', 'process_card'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': extractedText}),
    );
    if (kDebugMode) {
      print("Received response from Flask server");
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      emails = responseBody['emails'] ?? ['no email identified'];
      urls = responseBody['urls'] ?? ['no url'];
      phoneNumbers = responseBody['phoneNumbers'] ?? ['no phone'];
      jobPositions = responseBody['jobPositions'] ?? ['no job'];
      locations = responseBody['locations'] ?? ['no location'];
      names = responseBody['names'] ?? ['no name'];
      companyNames = responseBody['companyNames'] ?? ['no name'];

      if (kDebugMode) {
        print('Response Content: ${response.body}');
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DisplayScreen(
          names: names.cast(),
          companyNames: companyNames.cast(),
          jobPositions: jobPositions.cast(),
          emails: emails.cast(),
          phoneNumbers: phoneNumbers.cast(),
          urls: urls.cast(),
          locations: locations.cast(),
        );
      }));
    } else {
      if (kDebugMode) {
        print('API Error: ${response.body}');
      }
    }
  }

  Future<void> _getFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    processImage(File(pickedImage.path));
  }

  void setFocusPoint(Offset normalizedOffset) {
    if (cameraController != null && cameraController!.value.isInitialized) {
      if (!cameraController!.value.isCaptureOrientationLocked) {
        if (kDebugMode) {
          print('Auto-focus is not supported for this camera.');
        }
        return;
      }

      final double x = normalizedOffset.dx * 2000 - 1000;
      final double y = normalizedOffset.dy * 2000 - 1000;

      cameraController!.setFocusMode(FocusMode.auto);
      cameraController!.setFocusPoint(Offset(x, y));
    }
  }
}

void _toggleFlashlight(CameraController cameraController) {
  if (cameraController.value.isInitialized) {
    final bool isFlashOn = cameraController.value.flashMode == FlashMode.torch;
    final FlashMode newFlashMode = isFlashOn ? FlashMode.off : FlashMode.torch;
    cameraController.setFlashMode(newFlashMode);
  }
}

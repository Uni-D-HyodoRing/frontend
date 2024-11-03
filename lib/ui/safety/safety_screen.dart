import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/const/app_color.dart';
import 'package:frontend/ui/common/components/posting_text_field.dart';
import 'package:frontend/ui/common/components/posting_title.dart';
import 'package:frontend/ui/common/style/box_decoration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/const/text_styles.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  XFile? fstImage;
  XFile? scdImage;

  late ImagePicker fstImagePicker;
  late ImagePicker sndImagePicker;

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    fstImagePicker = ImagePicker();
    sndImagePicker = ImagePicker();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 0.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: postingBoxDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("안부 보내기", style: TextStyles.black16bold),
              const SizedBox(height: 16.0),
              PostingTitle(
                name: "김만두",
                date: "2024.11.02",
                button: TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      insetPadding: const EdgeInsets.all(20.0),
                      backgroundColor: Colors.white,
                      title: Text(
                        "전송 완료!",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text("나의 안부가 잘 전달되었어요", style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.0,
                      ),),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              fstImage = null;
                              scdImage = null;
                              controller.clear();
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                            minimumSize: Size.zero,
                          ),
                          child: Text(
                            "닫기",
                            style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    minimumSize: Size.zero,
                  ),
                  child: Text(
                    "작성하기",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: PostingTextField(
                  controller: controller,
                  onChanged: (value) {},
                  hintText: "내용을 입력하세요",
                  isPosting: true,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => showImageSourceDialog(context, true),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: fstImage == null
                            ? Center(
                                child: SvgPicture.asset(
                                "assets/icon/camera.svg",
                                color: Colors.black,
                              ))
                            : DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  image: DecorationImage(
                                    image: FileImage(File(fstImage!.path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => showImageSourceDialog(context, false),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: scdImage == null
                            ? Center(
                                child: SvgPicture.asset(
                                "assets/icon/camera.svg",
                                color: Colors.black,
                              ))
                            : DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  image: DecorationImage(
                                    image: FileImage(File(scdImage!.path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showImageSourceDialog(BuildContext context, bool isFirst) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await (isFirst ? fstImagePicker : sndImagePicker)
                          .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      if (isFirst) {
                        fstImage = image;
                      } else {
                        scdImage = image;
                      }
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_library, color: AppColors.primaryColor),
                      const SizedBox(width: 12.0),
                      Text(
                        '갤러리에서 선택',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await (isFirst ? fstImagePicker : sndImagePicker)
                          .pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      if (isFirst) {
                        fstImage = image;
                      } else {
                        scdImage = image;
                      }
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: AppColors.primaryColor),
                      const SizedBox(width: 12.0),
                      Text(
                        '카메라로 촬영',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/select_img.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3d416d),
        automaticallyImplyLeading: false,
        title: const Text('Профиль'),
        centerTitle: true,
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.only(right: 15),
        //     child: Icon(CupertinoIcons.settings),
        //   ),
        // ],
      ),
      backgroundColor: const Color(0xff212338),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: w,
                  height: h * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              _showSelectPhotoOptions(context);
                            },
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(166, 238, 238, 238),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: _image == null
                                    ? const Image(
                                        width: 50,
                                        height: 50,
                                        image: NetworkImage(
                                            'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                                        fit: BoxFit.cover)
                                    : CircleAvatar(
                                        backgroundImage: FileImage(_image!),
                                        radius: 200.0,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text(
                                'DADAXON',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Turgunboev',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Бухгалтерия',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: w,
                  height: h * 0.09,
                  child: Column(
                    children: [
                      CupertinoButton(
                        borderRadius: BorderRadius.circular(20),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: const Color.fromARGB(255, 16, 197, 70),
                        onPressed: () {},
                        child: const Text(
                          'Поделиться моим прогрессом',
                          style: TextStyle(
                              fontFamily: 'Monserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Ваши компетенции',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff3d416d),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            width: 45,
                            height: 45,
                            color: Color(0xffffd531),
                            image: Svg(
                              'assets/icons/crown.svg',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Веб-Разработка',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: GFProgressBar(
                              percentage: 0.9,
                              radius: 50,
                              type: GFProgressType.circular,
                              child: Text(
                                '80%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              backgroundColor: Colors.black26,
                              progressBarColor:
                                  const Color.fromARGB(255, 16, 197, 70),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            width: 45,
                            height: 45,
                            color: Color(0xffffd531),
                            image: Svg(
                              'assets/icons/crown.svg',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Python',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: GFProgressBar(
                              percentage: 0.5,
                              radius: 50,
                              type: GFProgressType.circular,
                              child: Text(
                                '80%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              backgroundColor: Colors.black26,
                              progressBarColor:
                                  Color.fromARGB(255, 16, 197, 70),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            width: 45,
                            height: 45,
                            color: Color(0xffffd531),
                            image: Svg(
                              'assets/icons/crown.svg',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'SQL',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: GFProgressBar(
                              percentage: 0.3,
                              radius: 50,
                              type: GFProgressType.circular,
                              child: const Text(
                                '80%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              backgroundColor: Colors.black26,
                              progressBarColor:
                                  Color.fromARGB(255, 16, 197, 70),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: w,
                  height: h * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Выход',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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

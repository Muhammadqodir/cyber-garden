import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: Text('Профиль'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor: const Color(0xff212338),
      body: ListView(
        padding: EdgeInsets.zero,
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
                                color: Color.fromARGB(166, 238, 238, 238),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: _image == null
                                    ? Image(
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
                            children: [
                              Text(
                                'DADAXON',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Turgunboev',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w,
                  height: h * 0.09,
                  child: Row(
                    children: [
                      const Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(213, 255, 255, 255)),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 19,
                          color: Color.fromARGB(213, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w,
                  height: h * 0.09,
                  child: Row(
                    children: [
                      const Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(213, 255, 255, 255)),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 19,
                          color: Color.fromARGB(213, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w,
                  height: h * 0.09,
                  child: Row(
                    children: [
                      const Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(213, 255, 255, 255)),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 19,
                          color: Color.fromARGB(213, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: w,
                    height: h * 0.11,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(32, 158, 158, 158),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 37,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 211, 28, 15),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              'PRO',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Upgrade to Premium',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Text(
                                  'This subscription is auto-renewable',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(167, 255, 255, 255)),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 19,
                              color: Color.fromARGB(213, 255, 255, 255),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: w,
                  height: h * 0.07,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(211, 229, 16, 16),
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

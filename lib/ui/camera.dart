
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'display.dart';
import 'home_page.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  bool isCaptured = false;
  var resJson;
  bool retApi=true;
  final ImagePicker _picker = ImagePicker();
  File ? selectedImage;
  bool vidGet=false;
  Future<void> apiCall() async {
    print("inside Api Call------------------------------------------------");
    print(selectedImage);
    print("--------------------------------------------");
    var request = http.MultipartRequest(
      'POST',
    //  Uri.parse("https://anomaly-api-fyp.herokuapp.com/upload"),
      Uri.parse("http://192.168.137.214:5000/submit"),
      //Uri.parse("http://10.155.238.5:5000/upload"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    // ignore: avoid_print
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    setState(() {
      resJson = jsonDecode(response.body);
      retApi=false;
    });
    print('Return ----------------------------------------');
    print(resJson);
    print(resJson[0]['label'].length);
    print(resJson[1]['bbox'][0][0]);
    print("________________________________________");
  }
  void handleImage() async {
    final file = (await _picker.getImage(source: ImageSource.gallery,maxHeight: 416, maxWidth: 416));
        if (file != null) {
          isCaptured = true;
          selectedImage=File(file.path);
          apiCall();
          // Get.to( () => Display(image: selectedImage));
        }else{
          Get.to( () => const HomePage());
        }
    }
  @override
  void initState() {
    super.initState();
    handleImage();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: AppBar(
              iconTheme: const IconThemeData(color: Colors.blue),
              backgroundColor: const Color.fromRGBO(242,242,242,1),
              centerTitle: true,
              title:Text("Object Detection",style: GoogleFonts.poppins(
                  fontSize: width * 0.05,
                  fontWeight:FontWeight.w500,
                  color: Colors.black
              )),

              shape: const RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.blue,
                    size: width * 0.07,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Camera()),
                    );
                  },

                ),],
            )
        ),
        body:       retApi?
        const Center(child: CircularProgressIndicator()):
        Stack(
            alignment: AlignmentDirectional.center,
            children:[
      Container(
          width: 416,
          height: 416,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.yellow,
            ),
          ),
      child:
      Image.file(
        selectedImage!,
        fit: BoxFit.fitHeight,
      ),
      ),
              for (int i=0;i<resJson[1]['bbox'].length;i++)
                Positioned(
                  // left: 0,
                  // top: resJson[1]['bbox'][0][1],
                  left: resJson[1]['bbox'][i][0]-26,
                  top: resJson[1]['bbox'][i][1],
                  width: resJson[1]['bbox'][i][2] -
                      resJson[1]['bbox'][i][0],
                  height: resJson[1]['bbox'][i][3] -
                      resJson[1]['bbox'][i][1],
                  child: Container(
                    //width: resJson[1]['bbox'][i][2]-resJson[1]['bbox'][i][0],
                    //height: resJson[1]['bbox'][i][3]-resJson[1]['bbox'][i][1],
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.blue,
                        child: Text(
                          "${(resJson[0]['label'][i])}",
                          style: const TextStyle(
                              fontSize: 5, color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),),
            ]
        ),
    );
  }
}

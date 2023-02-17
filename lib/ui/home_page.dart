import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'camera.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    const style = TextStyle(color: Colors.black45);
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
      body: Center(child:
      TextButton(
        child: const Text(
          "Select Image",
          style: TextStyle(fontSize: 25),),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Camera()),
    );
    },
      )


      )
    );
  }
}

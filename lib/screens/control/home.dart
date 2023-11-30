import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:graduationupdate/colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../ml_helper/output_screen.dart';



class HomeModelScreen extends StatefulWidget {
  const HomeModelScreen({Key? key}) : super(key: key);

  @override
  _HomeModelScreenState createState() => _HomeModelScreenState();
}

class _HomeModelScreenState extends State<HomeModelScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  var Imagee;
  loadModel()async{
    await Tflite.loadModel(
      model:'assets/binary_classification.tflite',
      labels: 'assets/model/labels.txt',
    );
  }

  runModelOnImage(
      {
        required String ImagePath,
      }
      )async{
    var output=await Tflite.runModelOnImage(
      path: ImagePath,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    return output;
  }
  pickImage()async{
    var Pimage=await ImagePicker().pickImage(source: ImageSource.camera);
    if(Pimage==null)return null;
    setState(() {
      Imagee=Pimage;
    });
    var output=await runModelOnImage(ImagePath: Pimage!.path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OutputScreen(output: output,image: Image,)));
  }

  pickGallaryImage()async{
    var Pimage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(Pimage==null)return null;
    setState(() {
      Imagee=Pimage;
    });
    var output=await runModelOnImage(ImagePath: Pimage!.path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OutputScreen(output: output,image: Image,)));
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: (){
                            pickImage();
                          },
                          child: LottieBuilder.asset('images/animation_ll6w8pvm.json',width: 180,height: 180,)),
                      Text('Check ID By Camera')
                    ],
                  ),
                ),


                Column(
                  children: [
                    GestureDetector(
                        onTap: (){
                                             pickGallaryImage();

                        },
                        child: LottieBuilder.asset('images/animation_ll6w1t8t.json',width: 180,height: 180,)),
                    Text('Check ID By Gallery')

                  ],
                ),













              ],
            )
        ),
      ),
    );
  }
}



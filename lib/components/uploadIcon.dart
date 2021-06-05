import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadIcon extends StatefulWidget {
  @override
  _UploadIconState createState() => _UploadIconState();
}
class _UploadIconState extends State<UploadIcon> {
  PickedFile _image;
  final picker= ImagePicker();
  Future pickImage(bool isCamera) async{
    PickedFile image;
    if(isCamera){
      image=(await picker.getImage(source: ImageSource.camera));
    }else{
      image=(await picker.getImage(source: ImageSource.gallery));
    }
    setState(() {
      _image=image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.upload_file,
        color: Colors.black87,),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            elevation: 1,
              context: context,
              builder: (context) => Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){
                            pickImage(false);
                            },
                            icon: Icon(Icons.insert_drive_file,color: Colors.black87,size: 26,),),
                        Text('Documents',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          color: Colors.black54,
                        ),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){
                              pickImage(true);
                            },
                            icon: Icon(Icons.camera_alt,color: Colors.black87,size: 26,)),
                        Text('Camera',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          color: Colors.black54,
                        ),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: (){
                              pickImage(false);
                            },
                            icon: Icon(Icons.image,color: Colors.black87,size: 26,)),
                        Text('Gallery',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          color: Colors.black54,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),);
        });
  }}

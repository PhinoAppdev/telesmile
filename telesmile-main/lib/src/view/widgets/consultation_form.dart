// ignore_for_file: deprecated_member_use, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps, camel_case_types, unused_element

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:telesmile/src/constants/loggers.dart';
import 'package:telesmile/src/view/widgets/header.dart';
import 'package:http/http.dart' as http;

class Consultation_form extends StatefulWidget {
  const Consultation_form({Key? key}) : super(key: key);

  @override
  _Consultation_formState createState() => _Consultation_formState();
}

class _Consultation_formState extends State<Consultation_form> {
  String? choosevalue = "Male";
  final TextEditingController _name = TextEditingController();
  final TextEditingController _constactnumber = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _place = TextEditingController();
  final TextEditingController _complaint = TextEditingController();
  List<XFile>? _image;
  final imagePicker = ImagePicker();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  _imageFromGallery() async {
    List<XFile>? image = await imagePicker.pickMultiImage();
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header('Telesmile Consultation'),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  labletext('Name (الاسم)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration('Enter name (ادخل الاسم)'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter name";
                        }
                        return null;
                      },
                      onSaved: (String? name) {},
                    ),
                  ),
                  labletext('Contact Number (رقم التواصل)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: TextFormField(
                      controller: _constactnumber,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration('Enter contact number (ادخل رقم التواصل)'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter contact number";
                        }
                        if (value.length < 9) {
                          return "Please enter valid contact number";
                        }
                        return null;
                      },
                      onSaved: (String? phone) {},
                    ),
                  ),
                  labletext('Gender (الجنس)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        decoration: buildInputDecoration(''),
                        value: choosevalue,
                        hint: const Text("Select the gender"),
                        items: const [
                          DropdownMenuItem(
                            child: Text('Male (ذكر)'),
                            value: 'Male',
                          ),
                          DropdownMenuItem(
                            child: Text('Female (انثى)'),
                            value: 'Female',
                          ),
                          DropdownMenuItem(
                            child: Text('Others  (آخر)'),
                            value: 'Others',
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            choosevalue = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  labletext('Age (العمر)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: TextFormField(
                      controller: _age,
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration('Enter age (ادخل العمر)'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter age";
                        }
                        return null;
                      },
                    ),
                  ),
                  labletext('Place (المكان)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: TextFormField(
                      controller: _place,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration('Enter place (ادخل المكان)'),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter Place";
                        }
                        return null;
                      },
                    ),
                  ),
                  labletext('Chief Complaint (الشكوى الأساسية)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: TextFormField(
                      controller: _complaint,
                      // expands: true,
                      maxLines: 13,
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(''),
                    ),
                  ),
                  labletext('Intra-oral photographs (صور داخل الفم)'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 6),
                    child: ElevatedButton(
                      child: const Text('Upload Image'),
                      onPressed: () {
                        _showPicker(context);
                        logger.d(
                            '[Consultation_form] before upload image data: ' +
                                _image.toString());
                      },
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        color: const Color(0xFFFCB117),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            RegistrationUser();
                            print("Successful");
                          } else {
                            print("Unsuccessfull");
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        textColor: Colors.white,
                        child: const Text("Submit (إرسال)"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text labletext(String? labletext) {
    return Text(
      labletext!,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _imageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future RegistrationUser() async {
    List<String> images = [];
    for (int i = 0; i < _image!.length; i++) {
      final bytes = File(_image![i].path).readAsBytesSync();
      images.add('"' + base64.encode(bytes) + '"');
    }
    // var imagefile = _image!.readAsBytes();
    // url to registration php script
    var APIURL = "http://telesmile.co.in/app_apis/form.php" ;
    //json maping user entered details
    Map formdata = {
      'name': _name.text,
      'contact': _constactnumber.text,
      'age': _age.text,
      'place': _place.text,
      'complaint': _complaint.text,
      'gender': choosevalue!.toString(),
      'image': images.toString(),
      'API_KEY' : 'sXZ7tdYP7hy2qZKD9cL'
    };
    //send  data using http post to our php code
    http.Response response = await http.post(Uri.parse(APIURL), body: formdata);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Form Submitted"),
    ));
    _age.clear();
    _name.clear();
    _complaint.clear();
    _place.clear();
    _constactnumber.clear();
    _image!.clear();
    //getting response from php code, here
    var data = jsonDecode(response.body);
    logger.e("DATA: ${data}");
    logger.e("[Consultation form] imageformat data: " + images.toString());
  }
}

InputDecoration buildInputDecoration(String hinttext) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintText: hinttext,
    // label: Text(labelname),
    focusedBorder: const OutlineInputBorder(
      // borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Color(0xFFFCB117), width: 1.5),
    ),
    border: const OutlineInputBorder(
      // borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      // borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}
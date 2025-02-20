import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Account_details_pages/accountslogoutpage.dart';
import '../Account_details_pages/locationpage.dart';
import '../Account_details_pages/mydetailspage.dart';
import '../Account_details_pages/myorderpage.dart';
import '../Account_details_pages/paymentpage.dart';
import '../Account_details_pages/premierpage.dart';
import '../Account_details_pages/settingspage.dart';


class Accountpage extends StatefulWidget {

  Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  File? _image;
  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  final List<String> data = [
    "My order",
    "Priemier delivery",
    "My details",
    "Address book",
    "Payment Methods",
    "Settings",
    "Accounts"
  ];

  final List<IconData> icons = [
    Icons.border_all_sharp,
    Icons.workspace_premium,
    Icons.book_outlined,
    Icons.location_on,
    Icons.payment,
    Icons.contact_mail_sharp,
    Icons.person
  ];

  final List<Widget> pages = [
    const Accountpremierpage(),
    const GooglemapAplication(),
    const Accountpaymentpage(),
    const Settingspage(),
    const Accountslogoutpage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Stack(

                  children: [
                    GestureDetector(
                      onTap:_pickImage,
                      child: Container(
                        color: Colors.grey,
                        child:
                        //  _image != null
                        //     ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
                        //     : Text('select background photo'),
                        Image(image: NetworkImage("https://wallpapers.com/images/hd/pretty-profile-pictures-k1qebyviiyl0wx0x.jpg")),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 120,
                        width: 200,
                        child: CircleAvatar(
                          child:  _image != null
                              ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
                              : Text('select profile photo'),
                        ),
                      ),
                    ),
                    Center(
                      child: Align(
                        alignment: const AlignmentDirectional(0.2,-0.25),
                        child:CircleAvatar(
                            child:IconButton(onPressed:_pickImage,
                                icon:Icon(Icons.edit))
                        ),
                      ),
                    )
                  ],
                ),
                //to display data from firebase use future builder
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder:(context,index)
                    {
                      return ListTile(
                        leading: Icon(icons[index]),
                        title: Text(data[index]),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => pages[index],
                                ));
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

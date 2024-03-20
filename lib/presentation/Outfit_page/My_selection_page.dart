import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/All_clothes_outfit_page/All_clothes_outfit.dart';
import 'package:sdgp_test01/presentation/Outfit_page/widgets/Work_wear_outfit.dart';
import 'package:sdgp_test01/presentation/Outfit_page/widgets/Casusal_wear_outfit.dart';
import 'package:sdgp_test01/presentation/Outfit_page/widgets/Party_wear_outfit.dart';
import '../Outfit_page/widgets/frame4_item_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:sdgp_test01/core/Data_model/item_model.dart';
import 'package:flutter_svg/flutter_svg.dart';



class My_selection_page extends StatefulWidget {
  My_selection_page({Key? key}) : super(key: key);

  @override
  My_selection_pageState createState() => My_selection_pageState();
}

class My_selection_pageState extends State<My_selection_page> {

  bool isButton1Selected = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  final Color darkBoxColor = Colors.brown;
  final Color lightBoxColor = Colors.grey[300]!;
  String? selectedImageUrl;
  String? selectedImageUrl321;
  bool isDarkBoxSelected = false;
  bool isDarkBoxSelected_1 = false;
  String? topWearImageUrl;
  String? bottomWearImageUrl;
  String currentOutfitSelection = 'All Clothes';
  int _selectedIndex = 0;

  Future<void> _saveOutfitToFirebase(String outfitName) async {
    if (selectedImageUrl != null && selectedImageUrl321 != null) {
      try {
        CollectionReference outfits = FirebaseFirestore.instance.collection(
            'outfits');
        await outfits.add({
          'outfitName': outfitName,
          'topWearImageUrl': selectedImageUrl,
          'bottomWearImageUrl': selectedImageUrl321,
          'timestamp': FieldValue.serverTimestamp(),
        });

        setState(() {
          selectedImageUrl = null;
          selectedImageUrl321 = null;
        });

        print('Outfit saved to Firebase!');
      } catch (e) {
        print(e);
      }
    }else {
      print ("No images selected to save.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton(0, "Outfit Creation"),
                _buildTabButton(1, "Outfit Selection"),
              ],
            ),
          ),
          Expanded(

            child: Stack(
              children: <Widget>[
                _buildContent(0, OutfitCreationContent()),
                _buildContent(1, OutfitSelectionContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _selectedIndex == index ? Colors.black : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(int index, Widget child) {
    return AnimatedOpacity(
      opacity: _selectedIndex == index ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Visibility(
        visible: _selectedIndex == index,
        maintainState: true,
        child: child,
      ),
    );
  }
}


// ignore_for_file: must_be_immutable
class OutfitCreationContent extends StatefulWidget {
  OutfitCreationContent({Key? key}) : super(key: key);

  @override
  OutfitCreationContentState createState() => OutfitCreationContentState();
}

class OutfitCreationContentState extends State<OutfitCreationContent> {
  bool isButton1Selected = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  final Color darkBoxColor = Colors.brown;
  final Color lightBoxColor = Colors.grey[300]!;
  String? selectedImageUrl;
  String? selectedImageUrl321;
  bool isDarkBoxSelected = false;
  bool isDarkBoxSelected_1 = false;
  String? topWearImageUrl;
  String? bottomWearImageUrl;
  String currentOutfitSelection = 'All Clothes';
  String? darkBoxImageUrl;
  String? darkBox1ImageUrl;
  bool get wantKeepAlive => true;
  int selectedIndex = 0;

  Future<void> _saveOutfitToFirebase(String outfitName) async {
    if (selectedImageUrl != null && selectedImageUrl321 != null) {
      try {
        CollectionReference outfits = FirebaseFirestore.instance.collection(
            'outfits');
        await outfits.add({
          'outfitName': outfitName,
          'topWearImageUrl': selectedImageUrl,
          'bottomWearImageUrl': selectedImageUrl321,
          'timestamp': FieldValue.serverTimestamp(),
        });

        setState(() {
          selectedImageUrl = null;
          selectedImageUrl321 = null;
        });

        print('Outfit saved to Firebase!');
      } catch (e) {
        print(e);
      }
    }else {
      print ("No images selected to save.");
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Frame4ItemWidget(
                    onSelectionChanged: (String selection) {
                      setState(() {
                        currentOutfitSelection = selection;
                      });
                    },
                  ),
                  SizedBox(height: 10.v),
                  Container(
                    height: 520,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15),
                        _buildDarkBoxSection(),
                        SizedBox(height: 15),
                        _buildDarkBoxSection_321(),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildResetButton(),
                            _buildSaveButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildOutfitWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDarkBoxSection() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkBoxSelected = true;
        });
      },
      child: Container(
        width: 160.v,
        height: 160.v,
        decoration: BoxDecoration(
          color: darkBoxColor,
          borderRadius: BorderRadius.circular(20),
          image: selectedImageUrl != null ? DecorationImage(
            image: NetworkImage(selectedImageUrl!),
            fit: BoxFit.cover,
          ) : null,
        ),
        child: selectedImageUrl == null
            ? Center(
          child: Text(
            'Select a Topwear',
            style: TextStyle(
              fontSize: 15, // Set font size to 14
              // Add other styles if needed
            ),
          ),
        )
            : null,
      ),
    );
  }

  Widget _buildDarkBoxSection_321() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDarkBoxSelected_1 = true;
        });
      },
      child: Container(
        width: 160.v,
        height: 160.v,
        decoration: BoxDecoration(
          color: darkBoxColor,
          borderRadius: BorderRadius.circular(20),
          image: selectedImageUrl321 != null ? DecorationImage(
            image: NetworkImage(selectedImageUrl321!),
            fit: BoxFit.cover,
          ) : null,
        ),
        child: selectedImageUrl321 == null
            ? Center(
          child: Text(
            'Select a bottomwear',
            style: TextStyle(
              fontSize: 15, // Set font size to 14
              // Add other styles if needed
            ),
          ),
        )
            : null,
      ),
    );
  }

  Widget _buildResetButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          topWearImageUrl = null;
          bottomWearImageUrl = null;
          selectedImageUrl = null;
          selectedImageUrl321 == null;
        });
      },
      child: Text('Reset', style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }


  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        _showSaveOutfitDialog((String outfitName) {
          _saveOutfitToFirebase(outfitName);
          if (darkBoxImageUrl != null && darkBox1ImageUrl != null) {
            _saveOutfitToFirebase(
                outfitName);
          } else {
            // Handle the case when images are not selected
            print("Both images must be selected to save the outfit.");
          }
        });
      },
      child: Text('Save', style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

//   Future<void> _saveOutfitToFirebase(String outfitName, String? topWearUrl,
//       String? bottomWearUrl) async {
//     if (topWearUrl != null && bottomWearUrl != null) {
//       try {
//         // Reference to Firebase Storage
//         firebase_storage.FirebaseStorage storage = firebase_storage
//             .FirebaseStorage.instance;
//
//         // Upload the top wear image to Firebase Storage
//         String topWearImageFileName = 'topwear_${DateTime
//             .now()
//             .millisecondsSinceEpoch}';
//         firebase_storage.Reference topWearRef = storage.ref(
//             'outfit_images/$topWearImageFileName');
//         await topWearRef.putFile(
//             File(topWearUrl)); // Assuming these are file paths
//         String topWearImageUrl = await topWearRef.getDownloadURL();
//
//         // Upload the bottom wear image to Firebase Storage
//         String bottomWearImageFileName = 'bottomwear_${DateTime
//             .now()
//             .millisecondsSinceEpoch}';
//         firebase_storage.Reference bottomWearRef = storage.ref(
//             'outfit_images/$bottomWearImageFileName');
//         await bottomWearRef.putFile(
//             File(bottomWearUrl)); // Assuming these are file paths
//         String bottomWearImageUrl = await bottomWearRef.getDownloadURL();
//
//         // Save the outfit data to Firestore
//         CollectionReference outfits = FirebaseFirestore.instance.collection(
//             'outfits');
//         await outfits.add({
//           'outfitName': outfitName,
//           'topWearImageUrl': topWearImageUrl,
//           'bottomWearImageUrl': bottomWearImageUrl,
//           'timestamp': FieldValue.serverTimestamp(),
//           // To order outfits by creation time
//         });
//         setState(() {
//           selectedImageUrl = null;
//           selectedImageUrl321 = null; // Add this line
// // Add this line
//         });
//         // Handle successful upload and saving
//         print('Outfit saved to Firebase!');
//       } catch (e) {
//         // Handle errors, e.g., show an alert dialog
//         print(e);
//       }
//     } else {
//       // Handle the case when URLs are null (no images selected)
//       print("No images selected to save.");
//     }
//   }

  void _showSaveOutfitDialog(Function(String) onSave) {
    String outfitName = ''; // Variable to store the outfit name input by the user

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Outfit'),
          content: TextField(
            onChanged: (value) {
              outfitName = value;
            },
            decoration: InputDecoration(hintText: "Enter Outfit Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Save'),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                if (outfitName.isNotEmpty) {
                  onSave(outfitName);
                  Navigator.of(context).pop(); // Close the dialog after saving
                } else {
                  // Handle the case when the outfit name is not entered
                  print("Enter an outfit name to save.");
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildOutfitWidget() {
    switch (currentOutfitSelection) {
      case 'Casual':
        return Casual_wear_outfit(onImageSelected: (String url) {
          if (isDarkBoxSelected) {
            setState(() {
              selectedImageUrl = url;
              isDarkBoxSelected = false; // Reset the flag
            });
          } else if (isDarkBoxSelected_1) {
            setState(() {
              selectedImageUrl321 = url;
              isDarkBoxSelected_1 = false; // Reset the flag
            });
          }
        }); // Your casual wear widget
      case 'Work':
        return Party_wear_outfit(onImageSelected: (String url) {
          if (isDarkBoxSelected) {
            setState(() {
              selectedImageUrl = url;
              isDarkBoxSelected = false; // Reset the flag
            });
          } else if (isDarkBoxSelected_1) {
            setState(() {
              selectedImageUrl321 = url;
              isDarkBoxSelected_1 = false; // Reset the flag
            });
          }
        }); // Your work wear widget
      case 'Party':
        return Work_wear_outfit(onImageSelected: (String url) {
          if (isDarkBoxSelected) {
            setState(() {
              selectedImageUrl = url;
              isDarkBoxSelected = false; // Reset the flag
            });
          } else if (isDarkBoxSelected_1) {
            setState(() {
              selectedImageUrl321 = url;
              isDarkBoxSelected_1 = false; // Reset the flag
            });
          }
        }); // Your party wear widget
      default:
        return CustomContainerSection(onImageSelected: (String url) {
          if (isDarkBoxSelected) {
            setState(() {
              selectedImageUrl = url;
              isDarkBoxSelected = false; // Reset the flag
            });
          } else if (isDarkBoxSelected_1) {
            setState(() {
              selectedImageUrl321 = url;
              isDarkBoxSelected_1 = false; // Reset the flag
            });
          }
        }); // Default or all clothes widget
    }
  }


  Widget buildButton(BuildContext context, int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
        decoration: BoxDecoration(
          color:
          selectedIndex == index ? appTheme.lime400 : appTheme.blueGray100,
          borderRadius: BorderRadius.circular(17.h),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.black : appTheme.black900,
            fontSize: 10.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class OutfitSelectionContent extends StatefulWidget {
  const OutfitSelectionContent({Key? key}) : super(key: key);

  @override
  OutfitSelectionContentState createState() => OutfitSelectionContentState();
}

class OutfitSelectionContentState extends State<OutfitSelectionContent> {
  // List<ItemModel> items = List.generate(20, (_) => ItemModel());
  List<ItemModel> items = []; // Initialize an empty list for items

  @override
  void initState() {
    super.initState();
    _fetchOutfits(); // Call method to fetch outfits from Firestore when the widget initializes
  }

  Future<void> _fetchOutfits() async {
    try {
      // Fetch outfits collection from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('outfits').get();

      // Loop through documents and populate items list with retrieved data
      querySnapshot.docs.forEach((doc) {
        String topWearImageUrl = doc['topWearImageUrl'];
        String bottomWearImageUrl = doc['bottomWearImageUrl'];
        
        // Add retrieved data to the items list
        items.add(ItemModel(
          imageUrl: topWearImageUrl,
          // Add other properties as needed
        ));
        items.add(ItemModel(
          imageUrl: bottomWearImageUrl,
          // Add other properties as needed
        ));
      });

      // Update UI
      setState(() {});
    } catch (e) {
      print("Error fetching outfits: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 700.h,
        margin: const EdgeInsets.only(top: 200),
        decoration: const BoxDecoration(
          color: Color(0xFF8B7B7B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 30,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 20) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 150,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: items.map((item) {
                    return Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // child: item.isPlaceholder
                      //     ? SvgPicture.asset('assets/images/clothing_add.svg') // Update path as needed
                      //     : (item.imageUrl != null)
                      //     ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                      //     : const Center(child: Text('No Image')),
                      child: item.imageUrl != null
                          ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                          : SvgPicture.asset('assets/images/clothing_add.svg'), // Use placeholder widget here
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Section Widget
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as size;

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../constant/app_text.dart';
import '../constant/app_colors.dart';

class AddClientScreen extends StatefulWidget {
  final int? index;

  const AddClientScreen({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _box = Hive.box(AppText.hiveBox);
  final formkey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  int selectedIndex = 0;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future _addClient(Map<String, dynamic> newClient) async {
    await _box.add(newClient);

    log('Client Added' '${_box.values.toString()}');
  }

  Future _updateClient(Map<String, dynamic> items) async {
    await _box.putAt(widget.index!, items);
    log('Client Updated');
  }

  Future? _getClient() async {
    if (widget.index != null) {
      setState(() {
        _nameController.text = _box.getAt(widget.index!)['name'];
        _amountController.text = _box.getAt(widget.index!)['amount'].toString();
        _box.getAt(widget.index!)['image'] != null ? _image = XFile(_box.getAt(widget.index!)['image']) : null;
        _box.getAt(widget.index!)['isCashIn'] ? selectedIndex = 0 : selectedIndex = 1;
        selectedDate = _box.getAt(widget.index!)['date'];
      });
    }
    return null;
  }

  Future getCametaImage() async {
    _image = await _picker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      setState(() {
        _image;
      });
    }
  }

  Future getGalleryImage() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      setState(() {
        _image;
      });
    }
  }

  @override
  void initState() {
    log('initState');
    _getClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? AppText.addClientText : AppText.editClientText),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actionsPadding: const EdgeInsets.symmetric(vertical: 30),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          FloatingActionButton(
                            onPressed: () {
                              getCametaImage();
                              Navigator.pop(context);
                              // context.pop();
                            },
                            child: const Icon(Icons.camera_alt),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              getGalleryImage();
                              Navigator.pop(context);
                              // context.pop();
                            },
                            child: const Icon(Icons.photo_library),
                          )
                        ],
                      ),
                    ),
                    child: CircleAvatar(
                        // radius: 35,
                        minRadius: 30,
                        maxRadius: 36,
                        // backgroundColor: Colors.transparent,
                        backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
                        child: _image == null
                            ? const Icon(
                                Icons.add_a_photo_outlined,
                                size: 30,
                              )
                            : null),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    customRadio(AppText.cashInText, 0),
                    const SizedBox(
                      width: 10,
                    ),
                    customRadio(AppText.cashOutText, 1),
                  ],
                ),
                const Text(
                  AppText.nametext,
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppText.enterNameText;
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppText.amountText,
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppText.enterAmountText;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  AppText.descriptionText,
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  maxLines: 2,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_month, color: AppColors.primaryColor),
                  label: Text(DateFormat('dd/MM/yyyy').format(selectedDate)),
                  style: ElevatedButton.styleFrom(onPrimary: Colors.black, primary: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const size.Size(double.infinity, 50)),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (widget.index == null) {
                          _addClient({
                            "key": _box.values.length,
                            "name": _nameController.text,
                            "amount": _amountController.text,
                            "date": selectedDate,
                            "description": _descriptionController.text,
                            "isCashIn": selectedIndex == 0 ? true : false,
                            'image': _image?.path,
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(AppText.clientAddedText),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          _updateClient({
                            "key": widget.index!,
                            "name": _nameController.text,
                            "amount": _amountController.text,
                            "date": selectedDate,
                            "description": _descriptionController.text,
                            "isCashIn": selectedIndex == 0 ? true : false,
                            'image': _image?.path,
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(AppText.clientEditedText),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: widget.index == null ? const Text(AppText.addClientText) : const Text(AppText.editClientText)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex(index),
      style: OutlinedButton.styleFrom(
        primary: selectedIndex == index ? AppColors.whiteColor : AppColors.blackColor,
        backgroundColor: selectedIndex == index ? AppColors.primaryColor : AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text),
    );
  }
}

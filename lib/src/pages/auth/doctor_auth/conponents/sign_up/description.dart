
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/constant/constant.dart';

import '../../../../shared/widgets/subtitle.dart';
import '../../../authentication_conponents/my_button.dart';


class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadDescription();
  }

  void _loadDescription() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      descriptionController.text = prefs.getString('description') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      const Text(
                        "TheSpecialist",
                        style: TextStyle(color: primaryColor, fontSize: 24,),
                      ),
                      const Subtitle(sub: "Tell Us about yourself"),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 7,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "fill this field";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Tell us about yourself",
                          helperText: "Give a description of yourself and professional experience",
                          labelText: "About Me",
                        ),
                      ),
                      const SizedBox(height: 30),
                      MyButton(
                        title: "Continuer",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('description', descriptionController.text);
                            setState(() {
                                     Navigator.pushNamed(context,"/doctorSignUp");
                            });
                     
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

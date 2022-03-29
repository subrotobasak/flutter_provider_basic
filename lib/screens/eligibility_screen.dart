import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/eligibility_screen_provider.dart';

class EligibilityScreen extends StatelessWidget {
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Provider Basic'),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Form(child: Consumer<EligibilityScreenProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: provider.isEligible ? Colors.green : Colors.red,
                      ),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(hintText: 'Give Your Age'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("Check"),
                        onPressed: () {
                          final int age = int.parse(ageController.text.trim());
                          provider.checkEligibility(age);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(provider.message)
                  ],
                );
              },
            )),
          ),
        );
      }),
    );
  }
}

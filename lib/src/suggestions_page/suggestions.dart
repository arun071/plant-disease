import 'dart:io';

import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/services/disease_provider.dart';
import '/src/home_page/models/disease_model.dart';
import '/src/suggestions_page/components/plant_image.dart';
import '/src/suggestions_page/components/text_property.dart';
import 'package:provider/provider.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  static const routeName = '/suggestions';

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);

    Disease _disease = _diseaseService.disease;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMain,
        title: const Text('Suggestions'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bgr.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all((0.02 * size.height)),
            child: Column(
              children: [
                Flexible(
                    child: Center(
                        child: PlantImage(
                  size: size,
                  imageFile: File(_disease.imagePath),
                ))),
                Divider(
                  thickness: (0.0066 * size.height),
                  height: (0.013 * size.height),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: ListView(
                    children: [
                      TextProperty(
                        title: 'Disease Name',
                        value: capitalizeEachWord(_disease.name),
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'Possible Causes',
                        value: _disease.possibleCauses,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'Possible Solution',
                        value: _disease.possibleSolution,
                        height: size.height,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

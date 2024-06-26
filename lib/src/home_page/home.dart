import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '/constants/constants.dart';
import '/services/classify.dart';
import '/services/disease_provider.dart';
import '/services/hive_database.dart';
import '/src/home_page/components/greeting.dart';
import '/src/home_page/components/history.dart';
import '/src/home_page/components/instructions.dart';
import '/src/home_page/components/titlesection.dart';
import '/src/home_page/models/disease_model.dart';
import '/src/suggestions_page/suggestions.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);

    // Hive service
    HiveService _hiveService = HiveService();

    // Data
    Size size = MediaQuery.of(context).size;
    final Classifier classifier = Classifier();
    late Disease _disease;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMain,
        title: Text(
          'Plant Disease Detector',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25)
        ),
        child: IconButton(
          icon: Icon(Icons.file_upload_outlined,color: Colors.white,),
          onPressed: () async {
            late double _confidence;
            await classifier.getDisease(ImageSource.gallery).then((value) {
              _disease = Disease(
                  name: value![0]["label"], imagePath: classifier.imageFile.path);
        
              _confidence = value[0]['confidence'];
            });
            // Check confidence
            if (_confidence > 0.8) {
              // Set disease for Disease Service
              _diseaseService.setDiseaseValue(_disease);
        
              // Save disease
              _hiveService.addDisease(_disease);
        
              Navigator.restorablePushNamed(
                context,
                Suggestions.routeName,
              );
            } else {
              // Display unsure message
            }
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: [
            TitleSection('Instructions', size.height * 0.066),
            InstructionsSection(size),
            TitleSection('Your History', size.height * 0.066),
            HistorySection(size, context, _diseaseService)
          ],
        ),
      ),
    );
  }
}

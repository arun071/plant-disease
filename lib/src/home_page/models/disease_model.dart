import 'package:hive/hive.dart';

part 'disease_model.g.dart';

String capitalizeEachWord(String input) {
  if (input == null || input.isEmpty) {
    return '';
  }

  // Split the input string into individual words
  List<String> words = input.split(' ');

  // Capitalize the first letter of each word
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }
  }

  // Join the words back into a single string
  String result = words.join(' ');

  return result;
}

@HiveType(typeId: 0)
class Disease extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  late String possibleCauses;

  @HiveField(2)
  late String possibleSolution;

  @HiveField(3)
  late String imagePath;

  @HiveField(4)
  late DateTime dateTime;

  Disease({required this.name, required this.imagePath}) {
    dateTime = DateTime.now();
    print('hello\n');
    print(name);

    switch (capitalizeEachWord(name)) {
      case "Apple Apple Scab":
        possibleCauses = "Caused by the fungus Venturia inaequalis.";
        possibleSolution = "Use of fungicides such as myclobutanil and sulfur.";
        break;

      case "Apple Black Rot":
        possibleCauses =
            "Caused by the fungus Botryosphaeria obtusa, spreads through rain.";
        possibleSolution = "Pruning infected branches, applying fungicides.";
        break;

      case "Apple Cedar Apple Rust":
        possibleCauses =
            "Caused by the fungus Gymnosporangium juniperi-virginianae.";
        possibleSolution =
            "Prune infected branches, use fungicides like myclobutanil.";
        break;

      case "Apple Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Blueberry Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Cherry Including Sour Powdery Mildew":
        possibleCauses =
            "Caused by Podosphaera clandestina, favors high humidity.";
        possibleSolution =
            "Pruning to improve airflow, use of fungicides like sulfur.";
        break;

      case "Cherry Including Sour Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Corn Maize Cercospora Leaf Spot Gray Leaf Spot":
        possibleCauses =
            "Caused by the fungus Cercospora zeae-maydis, favored by warm and humid conditions.";
        possibleSolution =
            "Crop rotation, use of fungicides like chlorothalonil.";
        break;

      case "Corn Maize Common Rust":
        possibleCauses =
            "Caused by the fungus Puccinia sorghi, favored by cool and moist weather.";
        possibleSolution =
            "Use of resistant cultivars, crop rotation, and fungicides.";
        break;

      case "Corn Maize Northern Leaf Blight":
        possibleCauses =
            "Caused by the fungus Exserohilum turcicum, favored by high humidity.";
        possibleSolution =
            "Crop rotation, use of fungicides like azoxystrobin.";
        break;

      case "Corn Maize Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Grape Black Rot":
        possibleCauses =
            "Caused by the fungus Guignardia bidwellii, spreads through rain.";
        possibleSolution =
            "Pruning, cultural practices, and fungicides like myclobutanil.";
        break;

      case "Grape Esca Black Measles":
        possibleCauses =
            "Caused by the fungus Phaeomoniella chlamydospora and other pathogens.";
        possibleSolution = "Pruning, using fungicides like propiconazole.";
        break;

      case "Grape Leaf Blight Isariopsis Leaf Spot":
        possibleCauses =
            "Caused by the fungus Isariopsis leaf spot, favored by wet conditions.";
        possibleSolution =
            "Pruning, proper vineyard management, and fungicides like sulfur.";
        break;

      case "Grape Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Orange Haunglongbing Citrus Greening":
        possibleCauses =
            "Caused by the bacterium Candidatus Liberibacter spp. and spread by Asian citrus psyllid.";
        possibleSolution =
            "Removal of infected trees, control of psyllid populations, and application of bactericides.";
        break;

      case "Peach Bacterial Spot":
        possibleCauses =
            "Caused by the bacterium Xanthomonas arboricola pv. pruni.";
        possibleSolution =
            "Pruning to increase airflow, use of copper-based fungicides.";
        break;

      case "Peach Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Pepper Bell Bacterial Spot":
        possibleCauses =
            "Caused by Xanthomonas bacteria, spread through splashing rain.";
        possibleSolution =
            "Spray early and often. Use copper and Mancozeb sprays.";
        break;

      case "Pepper Bell Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Potato Early Blight":
        possibleCauses =
            "The fungus Alternaria solani, high humidity and long periods of leaf wetness.";
        possibleSolution =
            "Maintaining optimum growing conditions: proper fertilization, irrigation, and pests management.";
        break;

      case "Potato Late Blight":
        possibleCauses =
            "Occurs in humid regions with temperatures ranging between 4 and 29 °C.";
        possibleSolution =
            "Eliminating cull piles and volunteer potatoes, using proper harvesting and storage practices, and applying fungicides when necessary.";
        break;

      case "Potato Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Raspberry Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Soybean Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Squash Powdery Mildew":
        possibleCauses = "Caused by the fungus Podosphaera xanthii.";
        possibleSolution = "Improving airflow, using fungicides like sulfur.";
        break;

      case "Strawberry Leaf Scorch":
        possibleCauses =
            "Caused by the fungus Diplocarpon earlianum, favored by wet conditions.";
        possibleSolution =
            "Improving airflow, using fungicides like chlorothalonil.";
        break;

      case "Strawberry Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Tomato Bacterial Spot":
        possibleCauses =
            "Xanthomonas bacteria which can be introduced into a garden on contaminated seed and transplants, which may or may not show symptoms.";
        possibleSolution =
            "Remove symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants.";
        break;
      case "Tomato Early Blight":
        possibleCauses =
            "The fungus Alternaria solani, high humidity and long periods of leaf wetness.";
        possibleSolution =
            "Maintaining optimum growing conditions: proper fertilization, irrigation, and pests management.";
        break;

      case "Tomato Late Blight":
        possibleCauses = "Caused by the water mold Phytophthora infestans.";
        possibleSolution = "Timely application of fungicide.";
        break;

      case "Tomato Leaf Mold":
        possibleCauses = "High relative humidity (greater than 85%).";
        possibleSolution =
            "Growing leaf mold resistant varieties, use drip irrigation to avoid watering foliage.";
        break;

      case "Tomato Septoria Leaf Spot":
        possibleCauses =
            "It is a fungus and spreads by spores most rapidly in wet or humid weather. Attacks plants in the nightshade family, and can be harbored on weeds within this family.";
        possibleSolution =
            "Remove infected leaves immediately, use organic fungicide options.";
        break;

      case "Tomato Spider Mites Two Spotted Spider Mite":
        possibleCauses =
            "Spider mite feeding on leaves during hot and dry conditions.";
        possibleSolution =
            "Aiming a hard stream of water at infested plants to knock spider mites off the plants. Also use of insecticidal soaps, horticultural oils.";
        break;

      case "Tomato Target Spot":
        possibleCauses =
            "The fungus Corynespora cassiicola which spreads to plants.";
        possibleSolution =
            "Planting resistant varieties, keeping farms free from weeds.";
        break;

      case "Tomato Tomato Yellow Leaf Curl Virus":
        possibleCauses =
            "Physically spread plant-to-plant by the silverleaf whitefly.";
        possibleSolution =
            "Chemical control: Imidacloprid should be sprayed on the entire plant and below the leaves.";
        break;

      case "Tomato Tomato Mosaic Virus":
        possibleCauses =
            "Spread by aphids and other insects, mites, fungi, nematodes, and contact; pollen and seeds can carry the infection as well.";
        possibleSolution =
            "No cure for infected plants, remove all infected plants and destroy them.";
        break;

      case "Tomato Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      default:
        possibleCauses = "N/A";
        possibleSolution = "N/A";
        break;
    }
  }
}

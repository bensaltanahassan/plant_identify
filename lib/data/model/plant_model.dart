class PlantModelInformation {
  String? id;
  bool? status;
  String? date;
  String? localImagePath;
  String? confidenceType;
  String? className;
  String? image;
  bool? healthState;
  String? description;
  Nutritions? nutritions;
  List<Pathogen>? pathogen;
  String? result;

  PlantModelInformation(
      {this.status,
      this.result,
      this.id,
      this.date,
      this.localImagePath,
      this.confidenceType,
      this.className,
      this.image,
      this.healthState,
      this.description,
      this.nutritions,
      this.pathogen});

  PlantModelInformation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    id = json['id'];
    date = json['date'];
    localImagePath = json['localImagePath'];
    confidenceType = json['confidence_type'];
    className = json['class'];
    image = json['image'];
    healthState = json['health_state'];
    description = json['Description'];
    nutritions = json['nutritions'] != null
        ? Nutritions.fromJson(json['nutritions'])
        : null;
    if (json['pathogen'] != null) {
      pathogen = <Pathogen>[];
      json['pathogen'].forEach((v) {
        pathogen!.add(Pathogen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    data['id'] = id;
    data['date'] = date;
    data['localImagePath'] = localImagePath;
    data['confidence_type'] = confidenceType;
    data['class'] = className;
    data['image'] = image;
    data['health_state'] = healthState;
    data['Description'] = description;
    if (nutritions != null) {
      data['nutritions'] = nutritions!.toJson();
    }
    if (pathogen != null) {
      data['pathogen'] = pathogen!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nutritions {
  String? energyKcalKJ;
  String? waterG;
  String? proteinG;
  String? totalFatG;
  String? carbohydratesG;
  String? fiberG;
  String? sugarsG;
  String? calciumMg;
  String? ironMg;
  String? magnessiumMg;
  String? phosphorusMg;
  String? potassiumMg;
  String? sodiumG;
  String? vitaminAIU;
  String? vitaminCMg;
  String? vitaminB1Mg;
  String? vitaminB2Mg;
  String? viatminB3Mg;
  String? vitaminB5Mg;
  String? vitaminB6Mg;
  String? vitaminEMg;

  Nutritions(
      {this.energyKcalKJ,
      this.waterG,
      this.proteinG,
      this.totalFatG,
      this.carbohydratesG,
      this.fiberG,
      this.sugarsG,
      this.calciumMg,
      this.ironMg,
      this.magnessiumMg,
      this.phosphorusMg,
      this.potassiumMg,
      this.sodiumG,
      this.vitaminAIU,
      this.vitaminCMg,
      this.vitaminB1Mg,
      this.vitaminB2Mg,
      this.viatminB3Mg,
      this.vitaminB5Mg,
      this.vitaminB6Mg,
      this.vitaminEMg});

  Nutritions.fromJson(Map<String, dynamic> json) {
    energyKcalKJ = json['energy (kcal/kJ)'];
    waterG = json['water (g)'];
    proteinG = json['protein (g)'];
    totalFatG = json['total fat (g)'];
    carbohydratesG = json['carbohydrates (g)'];
    fiberG = json['fiber (g)'];
    sugarsG = json['sugars (g)'];
    calciumMg = json['calcium (mg)'];
    ironMg = json['iron (mg)'];
    magnessiumMg = json['magnessium (mg)'];
    phosphorusMg = json['phosphorus (mg)'];
    potassiumMg = json['potassium (mg)'];
    sodiumG = json['sodium (g)'];
    vitaminAIU = json['vitamin A (IU)'];
    vitaminCMg = json['vitamin C (mg)'];
    vitaminB1Mg = json['vitamin B1 (mg)'];
    vitaminB2Mg = json['vitamin B2 (mg)'];
    viatminB3Mg = json['viatmin B3 (mg)'];
    vitaminB5Mg = json['vitamin B5 (mg)'];
    vitaminB6Mg = json['vitamin B6 (mg)'];
    vitaminEMg = json['vitamin E (mg)'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['energy (kcal/kJ)'] = energyKcalKJ;
    data['water (g)'] = waterG;
    data['protein (g)'] = proteinG;
    data['total fat (g)'] = totalFatG;
    data['carbohydrates (g)'] = carbohydratesG;
    data['fiber (g)'] = fiberG;
    data['sugars (g)'] = sugarsG;
    data['calcium (mg)'] = calciumMg;
    data['iron (mg)'] = ironMg;
    data['magnessium (mg)'] = magnessiumMg;
    data['phosphorus (mg)'] = phosphorusMg;
    data['potassium (mg)'] = potassiumMg;
    data['sodium (g)'] = sodiumG;
    data['vitamin A (IU)'] = vitaminAIU;
    data['vitamin C (mg)'] = vitaminCMg;
    data['vitamin B1 (mg)'] = vitaminB1Mg;
    data['vitamin B2 (mg)'] = vitaminB2Mg;
    data['viatmin B3 (mg)'] = viatminB3Mg;
    data['vitamin B5 (mg)'] = vitaminB5Mg;
    data['vitamin B6 (mg)'] = vitaminB6Mg;
    data['vitamin E (mg)'] = vitaminEMg;
    return data;
  }
}

class Pathogen {
  String? name;
  String? value;
  String? about;

  Pathogen({this.name, this.value, this.about});

  Pathogen.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['confidence'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['confidence'] = value;
    data['about'] = about;
    return data;
  }
}

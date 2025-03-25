class ModelRobot {
  String? description;
  String? diets;
  String? disease;
  String? medications;
  String? precautions;
  String? workout;

  ModelRobot(
      {this.description,
        this.diets,
        this.disease,
        this.medications,
        this.precautions,
        this.workout});

  ModelRobot.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    diets = json['diets'];
    disease = json['disease'];
    medications = json['medications'];
    precautions = json['precautions'];
    workout = json['workout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['diets'] = this.diets;
    data['disease'] = this.disease;
    data['medications'] = this.medications;
    data['precautions'] = this.precautions;
    data['workout'] = this.workout;
    return data;
  }
}

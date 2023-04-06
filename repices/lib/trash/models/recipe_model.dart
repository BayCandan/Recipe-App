// class RecipeModel {
//   String? uri;
//   String? label;
//   String? image;
//   String? source;
//   String? url;
//   String? shareAs;
//   int? yield;
//   List<String>? dietLabels;
//   List<String>? ingredientLines;
//   List<Ingredients>? ingredients;
//   double? calories;
//   double? totalWeight;
//   int? totalTime;
//   List<String>? cuisineType;
//   List<String>? mealType;
//   List<String>? dishType;
//   TotalNutrients? totalNutrients;

//   RecipeModel(
//       { this.uri,
//       this.label,
//       this.image,
//       this.source,
//       this.url,
//       this.shareAs,
//       this.yield,
//       this.dietLabels,
//       this.ingredientLines,
//       this.ingredients,
//       this.calories,
//       this.totalWeight,
//       this.totalTime,
//       this.cuisineType,
//       this.mealType,
//       this.dishType,
//       this.totalNutrients});

//   RecipeModel.fromJson(Map<String, dynamic> json) {
//     uri = json['uri'];
//     label = json['label'];
//     image = json['image'];
//     source = json['source'];
//     url = json['url'];
//     shareAs = json['shareAs'];
//     yield = json['yield'];
//     dietLabels = json['dietLabels'].cast<String>();
//     ingredientLines = json['ingredientLines'].cast<String>();
//     if (json['ingredients'] != null) {
//       ingredients = new List<Ingredients>();
//       json['ingredients'].forEach((v) {
//         ingredients.add(new Ingredients.fromJson(v));
//       });
//     }
//     calories = json['calories'];
//     totalWeight = json['totalWeight'];
//     totalTime = json['totalTime'];
//     cuisineType = json['cuisineType'].cast<String>();
//     mealType = json['mealType'].cast<String>();
//     dishType = json['dishType'].cast<String>();
//     totalNutrients = json['totalNutrients'] != null
//         ? new TotalNutrients.fromJson(json['totalNutrients'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uri'] = this.uri;
//     data['label'] = this.label;
//     data['image'] = this.image;
//     data['source'] = this.source;
//     data['url'] = this.url;
//     data['shareAs'] = this.shareAs;
//     data['yield'] = this.yield;
//     data['dietLabels'] = this.dietLabels;
//     data['ingredientLines'] = this.ingredientLines;
//     if (this.ingredients != null) {
//       data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
//     }
//     data['calories'] = this.calories;
//     data['totalWeight'] = this.totalWeight;
//     data['totalTime'] = this.totalTime;
//     data['cuisineType'] = this.cuisineType;
//     data['mealType'] = this.mealType;
//     data['dishType'] = this.dishType;
//     if (this.totalNutrients != null) {
//       data['totalNutrients'] = this.totalNutrients.toJson();
//     }
//     return data;
//   }
// }

// class Ingredients {
//   String? text;
//   int? quantity;
//   String? measure;
//   String? food;
//   int? weight;
//   String? foodCategory;
//   String? foodId;
//   String? image;

//   Ingredients(
//       {this.text,
//       this.quantity,
//       this.measure,
//       this.food,
//       this.weight,
//       this.foodCategory,
//       this.foodId,
//       this.image});

//   Ingredients.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     quantity = json['quantity'];
//     measure = json['measure'];
//     food = json['food'];
//     weight = json['weight'];
//     foodCategory = json['foodCategory'];
//     foodId = json['foodId'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['text'] = this.text;
//     data['quantity'] = this.quantity;
//     data['measure'] = this.measure;
//     data['food'] = this.food;
//     data['weight'] = this.weight;
//     data['foodCategory'] = this.foodCategory;
//     data['foodId'] = this.foodId;
//     data['image'] = this.image;
//     return data;
//   }
// }

// class TotalNutrients {
//   ENERCKCAL? eNERCKCAL;
//   ENERCKCAL? fAT;
//   ENERCKCAL? fASAT;
//   ENERCKCAL? fATRN;
//   ENERCKCAL? fAMS;
//   ENERCKCAL? fAPU;
//   ENERCKCAL? cHOCDF;
//   ENERCKCAL? cHOCDFNet;
//   ENERCKCAL? fIBTG;
//   ENERCKCAL? sUGAR;
//   ENERCKCAL? sUGARAdded;
//   ENERCKCAL? pROCNT;
//   ENERCKCAL? cHOLE;
//   ENERCKCAL? nA;
//   ENERCKCAL? cA;
//   ENERCKCAL? mG;
//   ENERCKCAL? k;
//   ENERCKCAL? fE;
//   ENERCKCAL? zN;
//   ENERCKCAL? p;
//   ENERCKCAL? vITARAE;
//   ENERCKCAL? vITC;
//   ENERCKCAL? tHIA;
//   ENERCKCAL? rIBF;
//   ENERCKCAL? nIA;
//   ENERCKCAL? vITB6A;
//   ENERCKCAL? fOLDFE;
//   ENERCKCAL? fOLFD;
//   FOLAC? fOLAC;
//   ENERCKCAL? vITB12;
//   FOLAC? vITD;
//   ENERCKCAL? tOCPHA;
//   ENERCKCAL? vITK1;
//   FOLAC? sugarAlcohol;
//   ENERCKCAL? wATER;

//   TotalNutrients(
//       {this.eNERCKCAL,
//       this.fAT,
//       this.fASAT,
//       this.fATRN,
//       this.fAMS,
//       this.fAPU,
//       this.cHOCDF,
//       this.cHOCDFNet,
//       this.fIBTG,
//       this.sUGAR,
//       this.sUGARAdded,
//       this.pROCNT,
//       this.cHOLE,
//       this.nA,
//       this.cA,
//       this.mG,
//       this.k,
//       this.fE,
//       this.zN,
//       this.p,
//       this.vITARAE,
//       this.vITC,
//       this.tHIA,
//       this.rIBF,
//       this.nIA,
//       this.vITB6A,
//       this.fOLDFE,
//       this.fOLFD,
//       this.fOLAC,
//       this.vITB12,
//       this.vITD,
//       this.tOCPHA,
//       this.vITK1,
//       this.sugarAlcohol,
//       this.wATER});

//   TotalNutrients.fromJson(Map<String, dynamic> json) {
//     eNERCKCAL = json['ENERC_KCAL'] != null
//         ? new ENERCKCAL.fromJson(json['ENERC_KCAL'])
//         : null;
//     fAT = json['FAT'] != null ? new ENERCKCAL.fromJson(json['FAT']) : null;
//     fASAT =
//         json['FASAT'] != null ? new ENERCKCAL.fromJson(json['FASAT']) : null;
//     fATRN =
//         json['FATRN'] != null ? new ENERCKCAL.fromJson(json['FATRN']) : null;
//     fAMS = json['FAMS'] != null ? new ENERCKCAL.fromJson(json['FAMS']) : null;
//     fAPU = json['FAPU'] != null ? new ENERCKCAL.fromJson(json['FAPU']) : null;
//     cHOCDF =
//         json['CHOCDF'] != null ? new ENERCKCAL.fromJson(json['CHOCDF']) : null;
//     cHOCDFNet = json['CHOCDF.net'] != null
//         ? new ENERCKCAL.fromJson(json['CHOCDF.net'])
//         : null;
//     fIBTG =
//         json['FIBTG'] != null ? new ENERCKCAL.fromJson(json['FIBTG']) : null;
//     sUGAR =
//         json['SUGAR'] != null ? new ENERCKCAL.fromJson(json['SUGAR']) : null;
//     sUGARAdded = json['SUGAR.added'] != null
//         ? new ENERCKCAL.fromJson(json['SUGAR.added'])
//         : null;
//     pROCNT =
//         json['PROCNT'] != null ? new ENERCKCAL.fromJson(json['PROCNT']) : null;
//     cHOLE =
//         json['CHOLE'] != null ? new ENERCKCAL.fromJson(json['CHOLE']) : null;
//     nA = json['NA'] != null ? new ENERCKCAL.fromJson(json['NA']) : null;
//     cA = json['CA'] != null ? new ENERCKCAL.fromJson(json['CA']) : null;
//     mG = json['MG'] != null ? new ENERCKCAL.fromJson(json['MG']) : null;
//     k = json['K'] != null ? new ENERCKCAL.fromJson(json['K']) : null;
//     fE = json['FE'] != null ? new ENERCKCAL.fromJson(json['FE']) : null;
//     zN = json['ZN'] != null ? new ENERCKCAL.fromJson(json['ZN']) : null;
//     p = json['P'] != null ? new ENERCKCAL.fromJson(json['P']) : null;
//     vITARAE = json['VITA_RAE'] != null
//         ? new ENERCKCAL.fromJson(json['VITA_RAE'])
//         : null;
//     vITC = json['VITC'] != null ? new ENERCKCAL.fromJson(json['VITC']) : null;
//     tHIA = json['THIA'] != null ? new ENERCKCAL.fromJson(json['THIA']) : null;
//     rIBF = json['RIBF'] != null ? new ENERCKCAL.fromJson(json['RIBF']) : null;
//     nIA = json['NIA'] != null ? new ENERCKCAL.fromJson(json['NIA']) : null;
//     vITB6A =
//         json['VITB6A'] != null ? new ENERCKCAL.fromJson(json['VITB6A']) : null;
//     fOLDFE =
//         json['FOLDFE'] != null ? new ENERCKCAL.fromJson(json['FOLDFE']) : null;
//     fOLFD =
//         json['FOLFD'] != null ? new ENERCKCAL.fromJson(json['FOLFD']) : null;
//     fOLAC = json['FOLAC'] != null ? new FOLAC.fromJson(json['FOLAC']) : null;
//     vITB12 =
//         json['VITB12'] != null ? new ENERCKCAL.fromJson(json['VITB12']) : null;
//     vITD = json['VITD'] != null ? new FOLAC.fromJson(json['VITD']) : null;
//     tOCPHA =
//         json['TOCPHA'] != null ? new ENERCKCAL.fromJson(json['TOCPHA']) : null;
//     vITK1 =
//         json['VITK1'] != null ? new ENERCKCAL.fromJson(json['VITK1']) : null;
//     sugarAlcohol = json['Sugar.alcohol'] != null
//         ? new FOLAC.fromJson(json['Sugar.alcohol'])
//         : null;
//     wATER =
//         json['WATER'] != null ? new ENERCKCAL.fromJson(json['WATER']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.eNERCKCAL != null) {
//       data['ENERC_KCAL'] = this.eNERCKCAL.toJson();
//     }
//     if (this.fAT != null) {
//       data['FAT'] = this.fAT.toJson();
//     }
//     if (this.fASAT != null) {
//       data['FASAT'] = this.fASAT.toJson();
//     }
//     if (this.fATRN != null) {
//       data['FATRN'] = this.fATRN.toJson();
//     }
//     if (this.fAMS != null) {
//       data['FAMS'] = this.fAMS.toJson();
//     }
//     if (this.fAPU != null) {
//       data['FAPU'] = this.fAPU.toJson();
//     }
//     if (this.cHOCDF != null) {
//       data['CHOCDF'] = this.cHOCDF.toJson();
//     }
//     if (this.cHOCDFNet != null) {
//       data['CHOCDF.net'] = this.cHOCDFNet.toJson();
//     }
//     if (this.fIBTG != null) {
//       data['FIBTG'] = this.fIBTG.toJson();
//     }
//     if (this.sUGAR != null) {
//       data['SUGAR'] = this.sUGAR.toJson();
//     }
//     if (this.sUGARAdded != null) {
//       data['SUGAR.added'] = this.sUGARAdded.toJson();
//     }
//     if (this.pROCNT != null) {
//       data['PROCNT'] = this.pROCNT.toJson();
//     }
//     if (this.cHOLE != null) {
//       data['CHOLE'] = this.cHOLE.toJson();
//     }
//     if (this.nA != null) {
//       data['NA'] = this.nA.toJson();
//     }
//     if (this.cA != null) {
//       data['CA'] = this.cA.toJson();
//     }
//     if (this.mG != null) {
//       data['MG'] = this.mG.toJson();
//     }
//     if (this.k != null) {
//       data['K'] = this.k.toJson();
//     }
//     if (this.fE != null) {
//       data['FE'] = this.fE.toJson();
//     }
//     if (this.zN != null) {
//       data['ZN'] = this.zN.toJson();
//     }
//     if (this.p != null) {
//       data['P'] = this.p.toJson();
//     }
//     if (this.vITARAE != null) {
//       data['VITA_RAE'] = this.vITARAE.toJson();
//     }
//     if (this.vITC != null) {
//       data['VITC'] = this.vITC.toJson();
//     }
//     if (this.tHIA != null) {
//       data['THIA'] = this.tHIA.toJson();
//     }
//     if (this.rIBF != null) {
//       data['RIBF'] = this.rIBF.toJson();
//     }
//     if (this.nIA != null) {
//       data['NIA'] = this.nIA.toJson();
//     }
//     if (this.vITB6A != null) {
//       data['VITB6A'] = this.vITB6A.toJson();
//     }
//     if (this.fOLDFE != null) {
//       data['FOLDFE'] = this.fOLDFE.toJson();
//     }
//     if (this.fOLFD != null) {
//       data['FOLFD'] = this.fOLFD.toJson();
//     }
//     if (this.fOLAC != null) {
//       data['FOLAC'] = this.fOLAC.toJson();
//     }
//     if (this.vITB12 != null) {
//       data['VITB12'] = this.vITB12.toJson();
//     }
//     if (this.vITD != null) {
//       data['VITD'] = this.vITD.toJson();
//     }
//     if (this.tOCPHA != null) {
//       data['TOCPHA'] = this.tOCPHA.toJson();
//     }
//     if (this.vITK1 != null) {
//       data['VITK1'] = this.vITK1.toJson();
//     }
//     if (this.sugarAlcohol != null) {
//       data['Sugar.alcohol'] = this.sugarAlcohol.toJson();
//     }
//     if (this.wATER != null) {
//       data['WATER'] = this.wATER.toJson();
//     }
//     return data;
//   }
// }

// class ENERCKCAL {
//   String label;
//   double quantity;
//   String unit;

//   ENERCKCAL({this.label, this.quantity, this.unit});

//   ENERCKCAL.fromJson(Map<String, dynamic> json) {
//     label = json['label'];
//     quantity = json['quantity'];
//     unit = json['unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label'] = this.label;
//     data['quantity'] = this.quantity;
//     data['unit'] = this.unit;
//     return data;
//   }
// }

// class FOLAC {
//   String label;
//   int quantity;
//   String unit;

//   FOLAC({this.label, this.quantity, this.unit});

//   FOLAC.fromJson(Map<String, dynamic> json) {
//     label = json['label'];
//     quantity = json['quantity'];
//     unit = json['unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label'] = this.label;
//     data['quantity'] = this.quantity;
//     data['unit'] = this.unit;
//     return data;
//   }
// }

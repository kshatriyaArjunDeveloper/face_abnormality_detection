import 'dart:math';

/// A Singleton service class having abnormalities detection related services.
///
/// Functionalities available:
/// * [getAbnormalities] Gives a List of [AbnormalitiesEnum]
class AbnormalityDetectorService {
  // Making Singleton
  AbnormalityDetectorService._();

  static AbnormalityDetectorService? _instance;

  /// Singleton constructor for [AbnormalityDetectorService]
  factory AbnormalityDetectorService() {
    _instance ??= AbnormalityDetectorService._();
    return _instance!;
  }

  /// Gives a List of [AbnormalitiesEnum]
  Future<List<AbnormalitiesEnum>> getAbnormalities() async {
    await Future.delayed(
      const Duration(
        seconds: 10,
      ),
    );

    final random = Random();
    var abnormalitiesList = AbnormalitiesEnum.values;
    final indices =
        List<int>.generate(abnormalitiesList.length, (index) => index);
    indices.shuffle(random);
    final sublistIndices = indices.take(3);
    final sublist =
        sublistIndices.map((index) => abnormalitiesList[index]).toList();
    return sublist;
  }
}

/// All types of skin abnormalities
enum AbnormalitiesEnum {
  foreheadWrinkles,
  leftEyeFineLines,
  rightMidCheekPores,
  bottomRightLipFirmness,
}

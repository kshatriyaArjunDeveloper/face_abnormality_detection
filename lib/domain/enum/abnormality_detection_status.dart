enum AbnormalityDetectionStatusEnum {
  done,
  inProcess,
  initial,
}

extension Utility on AbnormalityDetectionStatusEnum {
  String get asString {
    switch (this) {
      case AbnormalityDetectionStatusEnum.done:
        return 'Processed';
      case AbnormalityDetectionStatusEnum.inProcess:
        return 'Processing';
      case AbnormalityDetectionStatusEnum.initial:
        return 'Still not started';
    }
  }
}
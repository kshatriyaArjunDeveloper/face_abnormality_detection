enum AbnormalityDetectionStatusEnum {
  done,
  inProcess,
  initial,
}

extension Utility on AbnormalityDetectionStatusEnum {
  String get asString {
    switch (this) {
      case AbnormalityDetectionStatusEnum.done:
        return 'Done';
      case AbnormalityDetectionStatusEnum.inProcess:
        return 'In Process';
      case AbnormalityDetectionStatusEnum.initial:
        return 'Still not started';
    }
  }
}
class Exercise {
  String? exerciseId;
  String? exerciseTitle;
  String? accessType;
  String? icon;
  String? exerciseUserStatus;
  String? jumlahSoal;
  int? jumlahDone;

  Exercise({
    this.exerciseId,
    this.exerciseTitle,
    this.accessType,
    this.icon,
    this.exerciseUserStatus,
    this.jumlahSoal,
    this.jumlahDone,
  });

  Exercise.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exercise_id'];
    exerciseTitle = json['exercise_title'];
    accessType = json['access_type'];
    icon = json['icon'];
    exerciseUserStatus = json['exercise_user_status'];
    jumlahSoal = json['jumlah_soal'];
    jumlahDone = json['jumlah_done'];
  }
}
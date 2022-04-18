class FileInfo {
  final String key;

  FileInfo({required this.key});


  factory FileInfo.fromJson(Map<String, dynamic> data){
    final key = data['key'] as String;
    return FileInfo(key: key);
  }
}

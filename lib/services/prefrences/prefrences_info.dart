import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PrefrencesServices extends ChangeNotifier {
  XFile? _user1favPic;
  XFile? _user2favPic;
  XFile? _user3favPic;
  XFile? _user4favPic;
  XFile? get user1favPic => _user1favPic;
  XFile? get user2favPic => _user2favPic;
  XFile? get user3favPic => _user3favPic;
  XFile? get user4favPic => _user4favPic;
  bool _isFileUploading = false;
  bool get isFileUploading => _isFileUploading;
  bool _loading = false;
  bool get loading => _loading;

  final ImagePicker _picker = ImagePicker();

  void change1favPic() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _user1favPic = image!;
    notifyListeners();
  }

  void change2favPic() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _user2favPic = image!;
    notifyListeners();
  }

  void change3favPic() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _user3favPic = image!;
    notifyListeners();
  }

  void change4favPic() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _user4favPic = image!;
    notifyListeners();
  }

  void setIsFileUploading(value) async {
    _isFileUploading = value;
    notifyListeners();
  }

  void setLoading(value) async{
    _loading = value;
    notifyListeners();
  }

  Future resetImages() async {
    _user1favPic = null;
    _user2favPic = null;
    _user3favPic = null;
    _user4favPic = null;
    notifyListeners();
  }
}

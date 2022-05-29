

import 'dart:io';

import 'package:flutter_full_learn/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload{
  bool?  downloadItem(FileItem? fileItem);
  void toShare(String path) async {
    await launchUrl(Uri.parse(path));
  }
}

class FileDownload extends IFileDownload with ShareMixin{
  
  @override
  bool?  downloadItem(FileItem? fileItem){
    if(fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }
  
  void smsShare(){}
}

class SMSDownload implements IFileDownload{
  @override
  bool? downloadItem(FileItem? fileItem) {
    if(fileItem == null) FileDownloadException();
    return null;
  }

  @override
  void toShare(String path) {
  }

}
class HalilDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }

}

class FileItem{
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload{
  void toShowFile(){}
}
import 'package:appwrite/appwrite.dart';
import 'package:student_demo_appwrite/utils/constant.dart';

class AppWriteClient {
  //CREATE CLIENT
  Client get _client {
    Client client = Client();

    client
        .setEndpoint(AppConstant.apiEndpoint)
        .setProject(AppConstant.projectId);

    return client;
  }

  static Account get account => Account(_instance._client);
  static Database get database => Database(_instance._client);
  static Storage get storage => Storage(_instance._client);

  static final AppWriteClient _instance = AppWriteClient._internal();
  AppWriteClient._internal();
  factory AppWriteClient() => _instance;
}

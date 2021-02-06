import 'dart:convert';

import 'package:bosco/app/features/family_setup/data/models/child_model.dart';
import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/core/constants/constants.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:sprintf/sprintf.dart';

abstract class ChildRemoteDataSource {
  Future<Either<Exception, Child>> getRandomChild(String language);
}

int i = 1;

class ChildRemoteDataSourceImpl implements ChildRemoteDataSource {
  final http.Client client;

  ChildRemoteDataSourceImpl({@required this.client});

  @override
  Future<Either<ServerException, ChildModel>> getRandomChild(
      String language) async {
    /// If we want to use constants we must use sprintf,
    /// otherwise we must hardcoded the url such as:
    /// `final url = "www.server.com/$language";` - bad behavior.
    final url = sprintf(EndpointConstants.RANDOM_FACT_URL_FORMAT, [language]);
    final response = await http.get(url);

    /// just for showing functionallity
    var statusCode = response.statusCode;
    if (i++ % 5 == 0) {
      statusCode = 429;
    }

    switch (statusCode) {

      // If the server did return a 200 OK response, just parse the json
      case 200:
        var responseBody =
            "{\"id\":\"111\",\"name\":\"Child\",\"source\":\"djtech.net\",\"avatar_url\":\"http:\/\/i.imgur.com\/BoN9kdC.png\"}";
        //return Right(ChildModel.fromJson(json.decode(response.body)));
        return Right(ChildModel.fromJson(json.decode(responseBody.toString())));
        break;

      /// If the server did not return a 200 OK response,
      /// the [EndpointConstants.RANDOM_FACT_URL_FORMAT]
      /// endpoint can return error code of 429 which means -
      /// Too many requests.
      case 429:
        return Left(ServerTooManyRequestsException());
        break;

      // If other error was returned it considered as unexcpected server error
      default:
        return Left(ServerUnexpectedException());
        break;
    }
  }
}

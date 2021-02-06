import 'dart:convert';

import 'package:bosco/app/features/family_setup/data/models/child_model.dart';
import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/core/constants/constants.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:sprintf/sprintf.dart';

abstract class ChildrenRemoteDataSource {
  Future<Either<Exception, List<Child>>> getChildren(String language);
}

int i = 1;

class ChildrenRemoteDataSourceImpl implements ChildrenRemoteDataSource {
  final http.Client client;

  ChildrenRemoteDataSourceImpl({@required this.client});

  @override
  Future<Either<ServerException, List<ChildModel>>> getChildren(
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
        var responseBody = "[" +
            "{\"id\":\"111\",\"name\":\"Child 1\",\"avatar_url\":\"http:\/\/i.imgur.com\/BoN9kdC.png\"}," +
            "{\"id\":\"222\",\"name\":\"Child 2\",\"avatar_url\":\"http:\/\/i.imgur.com\/BoN9kdC.png\"}" +
            "]";
        //return Right(ChildModel.fromJson(json.decode(response.body)));

        Iterable iterable = json.decode(responseBody);
        List<ChildModel> children = List<ChildModel>.from(
            iterable.map((model) => ChildModel.fromJson(model)));

        return Right(children);
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

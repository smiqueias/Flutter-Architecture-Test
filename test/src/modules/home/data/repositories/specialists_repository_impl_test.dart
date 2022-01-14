import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_architecture_test/src/core/domain/services/network_service.dart';
import 'package:flutter_architecture_test/src/modules/home/data/repositories/specialists_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NetworkServiceMock extends Mock implements NetworkService {}

class RequestMock extends Mock implements RequestOptions {}

void main() {
  final networkServiceMock = NetworkServiceMock();
  final repository = SpecialistsRepositoryImpl(networkServiceMock);

  test("should return the specialists categories", () async {
    when(() => networkServiceMock.get<List>(any())).thenAnswer(
      (_) async => Response(
        data: jsonResponseMock,
        requestOptions: RequestMock(),
      ),
    );

    final response = await repository.getSpecialists();
    expect(response[0].name, "Heart Specialist");
  });
}

final jsonResponseMock = jsonDecode(
    r'''
  [
    {
        "name": "Heart Specialist",
        "image_url": "https://raw.githubusercontent.com/PortalTelemedicina/mobile-test/main/icons/heart-shape-outline-with-lifeline.svg",
        "total": 10,
        "color": "#E5495E"
      },
      {
        "name": "Dental Care",
        "image_url": "https://raw.githubusercontent.com/PortalTelemedicina/mobile-test/main/icons/tooth.svg",
        "total": 2,
        "color": "#F6AF3D"
      },
      {
        "name": "Dermatology Specialist",
        "image_url": "https://raw.githubusercontent.com/PortalTelemedicina/mobile-test/main/icons/pimples.svg",
        "total": 4,
        "color": "#7349E5"
      }
   ]
''');

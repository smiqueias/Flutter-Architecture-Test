import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_architecture_test/src/core/domain/services/network_service.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/data/repositories/heart_specialists_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NetworkServiceMock extends Mock implements NetworkService {}

class RequestMock extends Mock implements RequestOptions {}

void main() {
  final networkServiceMock = NetworkServiceMock();
  final repository = HeartSpecialistsRepositoryImpl(networkServiceMock);

  test("should return all heart specialists", () async {
    when(() => networkServiceMock.get<List>(any())).thenAnswer(
      (_) async => Response(
        data: jsonResponseMock,
        statusCode: 200,
        requestOptions: RequestMock(),
      ),
    );
    final response = await repository.getHeartSpecialist();
    expect(response[0].name, "Pedro Silvester");
  });
}

final jsonResponseMock = jsonDecode(
    r'''
  [
    {
        "name": "Pedro Silvester",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec est lorem. Duis nec pretium arcu. Vivamus pretium leo felis",
        "distance": 0.62,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/",
            "call": "(00) 91234-1234"
        }
    },
    {
        "name": "Margaret",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec est lorem. Duis nec pretium arcu. Vivamus pretium leo felis",
        "distance": 3.23,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/",
            "call": "(00) 91234-1234"
        }
    },
    {
        "name": "Daisy",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec est lorem",
        "distance": 4.34,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/"
        }
    },
    {
        "name": "Hugh Cameron",
        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec est lorem",
        "actions": {
            "chat": "https://portaltelemedicina.com.br/",
            "call": "(00) 91234-1234"
        }
    },
    {
        "name": "Zakariya Ryan",
        "description": "Aenean non diam in mi consequat efficitur eget at enim. Duis vitae odio eget mauris consequat tempus. Duis non erat vitae quam feugiat interdum. Aenean sit amet molestie quam. Vivamus sed nunc vitae nulla egestas varius. Donec facilisis sodales orci quis tempus. Nullam auctor faucibus justo vel semper",
        "distance": 4.45,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/",
            "call": "(00) 91234-1234"
        }
    },
    {
        "name": "Jonathon Palacios",
        "description": "Aenean id placerat leo. Sed consequat ex sed tempus commodo.",
        "distance": 7.87,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/"
        }
    },
    {
        "name": "Eamonn Estes",
        "description": "Aenean id placerat leo. Sed consequat ex sed tempus commodo.",
        "distance": 9.21,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/"
        }
    },
    {
        "name": "Mared Mathews",
        "description": "Aenean non diam in mi consequat efficitur eget at enim. Duis vitae odio eget mauris consequat tempus. Duis non erat vitae quam feugiat interdum. Aenean sit amet molestie quam. Vivamus sed nunc vitae nulla egestas varius. Donec facilisis sodales orci quis tempus. Nullam auctor faucibus justo vel semper",
        "distance": 9.53,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/",
            "call": "(00) 91234-1234"
        }
    },
    {
        "name": "Paula Bartlett",
        "description": "Aenean non diam in mi consequat efficitur eget at enim. Duis vitae odio eget mauris consequat tempus. Duis non erat vitae quam feugiat interdum. Aenean sit amet molestie quam. Vivamus sed nunc vitae nulla egestas varius. Donec facilisis sodales orci quis tempus. Nullam auctor faucibus justo vel semper",
        "distance": 9.64,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/",
            "call": "(00) 91234-1234"
        }
    },
    {
        "name": "Derrick House",
        "description": "Aenean id placerat leo. Sed consequat ex sed tempus commodo.",
        "distance": 10.10,
        "actions": {
            "chat": "https://portaltelemedicina.com.br/"
        }
    }
   ]
''');

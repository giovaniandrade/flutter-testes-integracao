import 'package:client_control/models/client.dart';
import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Clients test:',
    () {
      final kako = Client(
          name: 'Kako',
          email: 'kako@alura.com',
          type: ClientType(name: 'Gold', icon: Icons.star));

      test('Clients model should add new client', () {
        var clients = Clients(clients: []);
        clients.add(kako);
        clients.add(kako);
        expect(clients.clients, [kako, kako]);
      });

      test('Clients model remove old client', () {
        var clients = Clients(clients: [kako, kako, kako]);
        clients.remove(0);
        clients.remove(1);
        expect(clients.clients, [kako]);
      });
    },
  );

  group(
    'Types test:',
    () {
      final gold = ClientType(name: 'Gold', icon: Icons.star);

      test('Types model should add new type', () {
        var types = Types(types: []);
        types.add(gold);
        types.add(gold);
        expect(types.types, [gold, gold]);
      });

      test('Types model remove old type', () {
        var types = Types(types: [gold, gold, gold]);
        types.remove(0);
        types.remove(1);
        expect(types.types, [gold]);
      });
    },
  );
}

library casino;

import 'package:casino/chip.dart';
import 'package:casino/roll_dice_game.dart';
import 'bet.dart';
import 'exceptions.dart';

class Player {
  RollDiceGame? _currentGame;
  Chip _availableChips = Chip(0);

  bool isInGame() => _currentGame != null;

  join(RollDiceGame game) {
    if (isInGame()) {
      throw InvalidOperationException();
    }
    _currentGame = game;
    _currentGame?.addPlayer(this);
  }

  leaveGame() {
    if (!isInGame()) {
      throw InvalidOperationException();
    }
    _currentGame?.removePlayer(this);
    _currentGame = null;
  }

  buy(Chip chips) => _availableChips = chips;

  has(Chip chips) => _availableChips >= chips;

  bet(Bet bet) {
    throw NotImplementedException();
  }
}
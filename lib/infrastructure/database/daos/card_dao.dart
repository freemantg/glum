import 'package:drift/drift.dart';

import '../../dtos/dtos.dart';
import '../drift_database.dart';

part 'card_dao.g.dart';

@DriftAccessor(tables: [Cards, CardPhotos, Photos])
class CardDao extends DatabaseAccessor<GlumDatabase> with _$CardDaoMixin {
  // Constructor
  CardDao(this.db) : super(db);
  final GlumDatabase db;

  // Insert a new card into the database
  Future<void> insertCard(CardDto cardDto) async {
    final cardCompanion = CardsCompanion.insert(
      monthYear: cardDto.monthYear,
      colorValue: Value(cardDto.colorValue),
    );
    final cardId = await into(cards).insert(cardCompanion);

    if (cardDto.photo != null) {
      final photoCompanion = PhotosCompanion.insert(
        fileName: cardDto.photo!.fileName,
        filePath: cardDto.photo!.filePath,
      );
      final photoId = await into(photos).insert(photoCompanion);
      final cardPhotoCompanion = CardPhotosCompanion.insert(
        cardId: cardId,
        photoId: photoId,
      );
      await into(cardPhotos).insert(cardPhotoCompanion);
    }
  }

  // Update an existing card in the database
  Future<void> updateCard(CardDto cardDto) async {
    final id = cardDto.id;
    if (id != null) {
      await deleteCard(id);
      await insertCard(cardDto);
    }
  }

  // Delete a card from the database
  Future<void> deleteCard(int cardId) async {
    // First, delete any associated card and photos from join tables.
    await (delete(cardPhotos)..where((tbl) => tbl.cardId.equals(cardId))).go();
    await (delete(cards)..where((tbl) => tbl.id.equals(cardId))).go();
  }

  // Watch all cards in the database
  Stream<List<CardDto>> watchAllCards() {
    final query = select(cards).join(
      [
        leftOuterJoin(cardPhotos, cardPhotos.cardId.equalsExp(cards.id)),
        leftOuterJoin(photos, photos.id.equalsExp(cardPhotos.photoId)),
      ],
    );

    return query.watch().map(
      (rows) {
        final cardDtos = <CardDto>[];

        for (final row in rows) {
          final cardData = row.readTable(cards);
          final photoData = row.readTableOrNull(photos);

          final cardDto = CardDto(
            id: cardData.id,
            monthYear: cardData.monthYear,
            colorValue: cardData.colorValue,
            photo: (photoData != null)
                ? PhotoDto.fromJson(photoData.toJson())
                : null,
          );
          cardDtos.add(cardDto);
        }
        return cardDtos;
      },
    );
  }
}

import 'package:hotel_booking/features/home/data/models/hotel_item_dto.dart';
import 'package:hotel_booking/features/home/data/models/hotels_response.dart';
import 'package:hotel_booking/features/home/data/models/image_item_dto.dart';

final hotelsResponse = HotelsResponse(
  hotels: [
    HotelItemDTO(
      name: "Can Picafort Palace",
      destination: "Can Picafort, Mallorca, Spanien",
      hotelId: "35489-giata",
      images: [
        ImageItemDTO(
            large: "https://image-resizer.prod.invia-travel.io/images/multicode/35489/org/hotel35489-f9067e59-71da-42cc-af29-0dc42bd7eec2.jpeg?width=700&height=525",
            small: "https://image-resizer.prod.invia-travel.io/images/multicode/35489/org/hotel35489-f9067e59-71da-42cc-af29-0dc42bd7eec2.jpeg?width=400&height=300"),
        ImageItemDTO(
            large: "https://image-resizer.prod.invia-travel.io/images/multicode/35489/org/hotel35489-82b191cc-c71d-4d5a-a6dd-f16f533f7f81.jpeg?width=700&height=525",
            small: "https://image-resizer.prod.invia-travel.io/images/multicode/35489/org/hotel35489-82b191cc-c71d-4d5a-a6dd-f16f533f7f81.jpeg?width=400&height=300"),
      ],
    ),
    HotelItemDTO(
      name: "Iberostar Waves Pinos Park",
      destination: "Font de Sa Cala, Mallorca, Spanien",
      hotelId: "3202-giata",
      images: [
        ImageItemDTO(
          large: "https://image-resizer.prod.invia-travel.io/images/xmldata/3202/org/hotel3202-dbf367a8-0e9d-4362-b425-170b10555fa0.jpeg?width=700&height=525",
          small: "https://image-resizer.prod.invia-travel.io/images/xmldata/3202/org/hotel3202-dbf367a8-0e9d-4362-b425-170b10555fa0.jpeg?width=400&height=300",
        ),
        ImageItemDTO(
          large: "https://image-resizer.prod.invia-travel.io/images/xmldata/3202/org/hotel3202-58721741-6f5f-4e99-aaed-c27684b89e76.jpeg?width=700&height=525",
          small: "https://image-resizer.prod.invia-travel.io/images/xmldata/3202/org/hotel3202-58721741-6f5f-4e99-aaed-c27684b89e76.jpeg?width=400&height=300",
        ),
      ],
    ),
  ],
);

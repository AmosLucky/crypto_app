import 'package:crypto_app_mobile/models/transaction_model.dart';

var basedomain = "https://reqres.in/";

var loginUrl = basedomain + "api/users?page=2";
var createAccountUrl = basedomain + "api/users?page=2";
List<Map<String, dynamic>> coins = [
  {
    "id": 1,
    "name": "Litecoin",
    "balance": 500,
    "symbol": "LTC",
    "address": "oxuurrurrrurr",
    "image":
        "https://pixlok.com/wp-content/uploads/2022/01/Litecoin-Logo-PNG-psjkcd.jpg",
    'qr_code':
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/QR-code-obituary.svg/220px-QR-code-obituary.svg.png"
  },
  {
    "id": 2,
    "name": "Bitcoin",
    "balance": 700,
    "symbol": "BTC",
    "address": "oxuurrurrrurr",
    "image": "https://pngimg.com/d/bitcoin_PNG48.png",
    'qr_code':
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/QR-code-obituary.svg/220px-QR-code-obituary.svg.png"
  },
  {
    "id": 3,
    "name": "Etherium",
    "balance": 800,
    "symbol": "ETH",
    "address": "oxuurrurrrurr",
    "image":
        "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo-thumbnail.png",
    'qr_code':
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/QR-code-obituary.svg/220px-QR-code-obituary.svg.png"
  },
  {
    "id": 4,
    "name": "BNB",
    "balance": 1000,
    "symbol": "BTC",
    "address": "oxuurrurrrurr",
    "image":
        "https://w7.pngwing.com/pngs/1007/775/png-transparent-bnb-cryptocurrencies-icon-thumbnail.png",
    'qr_code':
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/QR-code-obituary.svg/220px-QR-code-obituary.svg.png"
  },
  {
    "id": 4,
    "name": "Bitcoin",
    "balance": 700,
    "symbol": "BTC",
    "address": "oxuurrurrrurr",
    "image": "https://pngimg.com/d/bitcoin_PNG48.png",
    'qr_code':
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/QR-code-obituary.svg/220px-QR-code-obituary.svg.png"
  },
  {
    "id": 6,
    "name": "Doge",
    "balance": 1600,
    "symbol": "doge",
    "address": "oxuurrurrrurr",
    "image": "https://cdn.freebiesupply.com/logos/thumbs/2x/dogecoin-logo.png",
    'qr_code':
        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/QR-code-obituary.svg/220px-QR-code-obituary.svg.png"
  },
];

List<Map<String, dynamic>> transactions = [
  {
    "name": "Bitcoin",
    "amount": 700,
    "symbol": "BTC",
    "type": "2",
    "status": "pending",
    "date": "9-0-2023"
  },
  {
    "name": "litcoin",
    "amount": 700,
    "symbol": "BTC",
    "type": "1",
    "status": "approved",
    "date": "9-0-2023"
  },
  {
    "name": "Bitcoin",
    "amount": 700,
    "symbol": "BTC",
    "type": "1",
    "status": "approved",
    "date": "9-0-2023"
  },
  {
    "name": "Bitcoin",
    "amount": 700,
    "symbol": "BTC",
    "type": "1",
    "status": "approved",
    "date": "9-0-2023"
  }
];

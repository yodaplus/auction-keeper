#!/usr/bin/env node

const readline = require("readline");
const fetch = require("node-fetch");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false,
});

const MARGIN = 0.05;

rl.on("line", async (line) => {
  const obj = JSON.parse(line);

  const res = await fetch(
    "https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=XDC-USDT"
  );
  const resJson = await res.json();

  const priceMarket = resJson?.data?.price;
  const { price: priceAuction } = obj;
  const priceBid = priceMarket * (1 - MARGIN);

  console.error(
    `Market price: ${priceMarket}, Auction price: ${priceAuction}, Bid price: ${priceBid}`
  );

  if (priceAuction < priceBid) {
    console.error(`Auction price dropped below our bid margin`);
  }

  console.log(JSON.stringify({ price: priceBid }));
});

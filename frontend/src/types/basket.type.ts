import type { Product } from "./product.type";

export type BasketParams = {
  basket: string;
};

export type BasketItem = {
  code: Product["code"];
  name: Product["name"];
  quantity: number;
  unit_price: number;
  final_price: number;
};

export type Basket = {
  items: BasketItem[];
  total: number;
};

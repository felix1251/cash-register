import type { Basket } from "../types/basket.type";
import config from "../utils/config";

export const getBasketList = async (basket: string): Promise<Basket> => {
  const response = await fetch(`${config.api_url}/basket?basket=${basket}`, {
    headers: { "Content-Type": "application/json" },
  });

  return await response.json();
};

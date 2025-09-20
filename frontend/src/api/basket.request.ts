import type { Basket } from "../types/basket.type";
import config from "../utils/config";

export const getBasketList = async (basket: string): Promise<Basket> => {
  const response = await fetch(`${config.api_url}/basket`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ basket }),
  });

  return await response.json();
};

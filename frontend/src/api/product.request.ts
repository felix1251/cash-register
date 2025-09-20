import type { Product } from "../types/product.type";
import config from "../utils/config";

export const getProductList = async (): Promise<Product[]> => {
  const response = await fetch(`${config.api_url}/products`, {
    headers: { "Content-Type": "application/json" },
  });

  return await response.json();
};

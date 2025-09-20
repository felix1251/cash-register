import type { Product } from "../types/product.type";
import Button from "./Button";

type Props = {
  product: Product;
  addToCart: (code: string) => void;
};

export default function ProductItem({ product, addToCart }: Props) {
  return (
    <div className="py-1.5 flex gap-3 items-center justify-between">
      <div>
        ({product.code}) {product.name}, Price: {product.base_price} €
      </div>
      <Button onClick={() => addToCart(product.code)} size="small">
        + Add to cart
      </Button>
    </div>
  );
}

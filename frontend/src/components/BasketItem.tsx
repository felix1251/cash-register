import type { BasketItem } from "../types/basket.type";

type Props = {
  item: BasketItem;
};

export default function BasketItem({ item }: Props) {
  return (
    <div className="py-1.5 flex gap-3 items-center justify-between">
      <div>
        ({item.code}) {item.name} x {item.quantity}, Unit price:{" "}
        {item.unit_price} €, Total: {item.final_price} €
      </div>
    </div>
  );
}

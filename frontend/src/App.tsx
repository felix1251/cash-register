import { useQuery } from "@tanstack/react-query";
import AppLayout from "./components/AppLayout";
import { getProductList } from "./api/product.request";
import { useState } from "react";
import ProductItem from "./components/ProductItem";
import BasketItem from "./components/BasketItem";
import { getBasketList } from "./api/basket.request";
import Spinner from "./components/Spinner";
import Button from "./components/Button";
import CodeButton from "./components/CodeButton";

function App() {
  const [basket, setBasket] = useState<string[]>([]);

  const { data: products, isLoading: productLoading } = useQuery({
    queryKey: ["products"],
    queryFn: getProductList,
  });

  const { data: basketList, isLoading: basketLoading } = useQuery({
    queryKey: ["basket", basket],
    queryFn: () => getBasketList(basket.join(",")),
    enabled: basket.length > 0,
  });

  function addToCart(code: string) {
    setBasket([...basket, code]);
  }

  function clearBasket() {
    setBasket([]);
  }

  function removeItem(index: number) {
    const newBasket = basket.filter((_, i) => i !== index);

    setBasket(newBasket);
  }

  return (
    <AppLayout>
      <div className="flex-1 grid grid-cols-2 gap-8">
        <div className="flex flex-col gap-2 border-2 border-secondary rounded-2xl px-5 py-3">
          <div className="flex gap-3 items-center">
            <h2 className="text-lg font-semibold">Products</h2>
            {productLoading && <Spinner />}
          </div>
          <div className="overflow-auto divide-y">
            {products?.map((product) => (
              <ProductItem
                key={product.id}
                product={product}
                addToCart={addToCart}
              />
            ))}
          </div>
        </div>
        <div className="flex flex-col gap-3 border-2 border-secondary rounded-2xl px-5 py-3">
          <div className="flex gap-3">
            <div className="flex gap-3 items-center">
              <h2 className="text-lg font-semibold">Cart / Basket</h2>
              {basketLoading && <Spinner />}
            </div>
            {basket.length > 0 && (
              <Button
                disabled={basketLoading}
                variant="secondary"
                size="small"
                onClick={clearBasket}
              >
                x clear
              </Button>
            )}
          </div>
          <div>
            <div className="mb-1.5">Product code:</div>
            <div className="flex gap-2 flex-wrap">
              {basket.length > 0 ? (
                basket.map((item, index) => (
                  <CodeButton
                    key={index}
                    index={index}
                    code={item}
                    removeItem={removeItem}
                  />
                ))
              ) : (
                <div className="text-red-800">No item to display</div>
              )}
            </div>
          </div>
          <div className="flex-1 overflow-auto">
            {basketList && (
              <div className="divide-y">
                {basketList.items.map((item) => (
                  <BasketItem key={item.code} item={item} />
                ))}
              </div>
            )}
          </div>
          <div className="flex gap-1 text-xl border-t border-secondary pt-3">
            <span>Total: </span>
            <div className="font-semibold">{basketList?.total || 0.0} €</div>
          </div>
        </div>
      </div>
    </AppLayout>
  );
}

export default App;

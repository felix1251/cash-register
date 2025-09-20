import { useQuery } from "@tanstack/react-query";
import AppLayout from "./components/AppLayout";
import { getProductList } from "./api/product.request";
import { useState } from "react";
import ProductItem from "./components/ProductItem";

function App() {
  const [basket, setBasket] = useState<string[]>([]);

  const { data: products } = useQuery({
    queryKey: ["products"],
    queryFn: getProductList,
  });

  function addToCart(code: string) {
    setBasket([...basket, code]);
  }

  return (
    <AppLayout>
      <div className="flex-1 grid grid-cols-2 gap-8">
        <div className="flex flex-col gap-2 border-2 border-secondary rounded-2xl px-5 py-3">
          <h2 className="text-lg font-semibold">Products</h2>
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
        <div className="flex flex-col gap-2 border-2 border-secondary rounded-2xl px-5 py-3">
          <h2 className="text-lg font-semibold">Cart / Basket</h2>
          {basket.join(",")}
        </div>
      </div>
    </AppLayout>
  );
}

export default App;

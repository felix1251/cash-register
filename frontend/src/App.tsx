import Button from "./components/Button";
import AppLayout from "./components/AppLayout";

function App() {
  return (
    <AppLayout>
      <div className="flex gap-2">
        <Button>Add to cart</Button>
        <Button variant="secondary">Clear</Button>
      </div>
    </AppLayout>
  );
}

export default App;

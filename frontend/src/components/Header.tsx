export default function Header() {
  return (
    <div className="flex flex-col gap-4">
      <div className="flex gap-1">
        <div className="h-3 w-3 rounded-full bg-secondary"></div>
        <div className="h-3 w-3 rounded-full bg-secondary"></div>
        <div className="h-3 w-3 rounded-full bg-secondary"></div>
      </div>
      <h2 className="text-2xl font-bold text-secondary">Cash Register</h2>
    </div>
  );
}

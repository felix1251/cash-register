import type { ReactNode } from "react";
import Header from "./Header";

export default function AppLayout({ children }: { children: ReactNode }) {
  return (
    <div className="flex-1 min-h-full px-6 py-5 w-full mx-auto max-w-7xl border-2 rounded-3xl border-secondary gap-4 flex flex-col">
      <Header />
      {children}
    </div>
  );
}

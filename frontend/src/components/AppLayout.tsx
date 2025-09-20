import type { ReactNode } from "react";
import Header from "./Header";

export default function AppLayout({ children }: { children: ReactNode }) {
  return (
    <div className="my-7 flex-1 min-h-full px-4 md:px-8 w-full mx-auto max-w-7xl py-7 border-2 rounded-3xl border-secondary gap-4 flex flex-col">
      <Header />
      {children}
    </div>
  );
}

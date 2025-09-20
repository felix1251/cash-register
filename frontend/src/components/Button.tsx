import { cn } from "../utils/style";

type ButtonProps = {
  variant?: "primary" | "secondary" | "warn";
} & React.ButtonHTMLAttributes<HTMLButtonElement>;

export default function Button({
  variant = "primary",
  children,
  ...props
}: ButtonProps) {
  return (
    <button
      className={cn(
        "px-9 py-2.5 text-white rounded-lg font-semibold",
        variant === "primary" && "bg-primary",
        variant === "secondary" && "bg-secondary",
        variant === "warn" && "bg-red-700",
      )}
      {...props}
    >
      {children}
    </button>
  );
}

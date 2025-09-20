import { cn } from "../utils/style";

type ButtonProps = {
  variant?: "primary" | "secondary" | "warn";
  size?: "default" | "small";
  disabled?: boolean;
} & React.ButtonHTMLAttributes<HTMLButtonElement>;

export default function Button({
  variant = "primary",
  size = "default",
  disabled,
  children,
  ...props
}: ButtonProps) {
  return (
    <button
      className={cn(
        "px-9 py-2.5 text-white rounded-lg font-semibold cursor-pointer",
        variant === "primary" && "bg-primary",
        variant === "secondary" && "bg-secondary",
        variant === "warn" && "bg-red-700",
        size === "small" && "text-sm py-1 px-3",
        disabled && "bg-gray-300",
      )}
      disabled={disabled}
      {...props}
    >
      {children}
    </button>
  );
}

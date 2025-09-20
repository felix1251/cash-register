import XIcon from "./XIcon";

type Props = {
  index: number;
  code: string;
  removeItem: (index: number) => void;
};

export default function CodeButton({ index, code, removeItem }: Props) {
  return (
    <button
      className="border px-2 rounded cursor-pointer flex gap-0.5 items-center"
      onClick={() => removeItem(index)}
    >
      {code} <XIcon />
    </button>
  );
}

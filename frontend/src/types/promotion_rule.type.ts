export type PromotionRule = {
  id: number;
  description: string;
  discount_value: number;
  min_quantity: number;
  rule_type: "BOGO" | "BULK_FIXED" | "BULK_FACTOR";
};

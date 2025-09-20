# Cash Register App

### README [backend/README.md](backend/README.md)

# Ruby on Rails Backend 

Copy ENV

```
cp .env.example .env
```

Install dependencies

```
bundle install
```

Run postgres docker instance

```
docker compose up -d
```

Initiate DB

```
rails db:create
rails db:migrate
rails db:seed
```

Run locally

```
bin/rails server
```

RSpec unit test

```
bin/rails spec
```

Annotate

```
annotate
```

## DB Schema

```yaml
# Table name: products
#
#  id         :bigint           not null, primary key
#  base_price :decimal(10, 2)   not null
#  code       :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_code  (code) UNIQUE
#
```

```yaml
# Table name: promotion_rules
#
#  id             :bigint           not null, primary key
#  description    :string           not null
#  discount_value :decimal(, )      not null
#  min_quantity   :integer          not null
#  priority       :integer          default(0)
#  rule_type      :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_promotion_rules_on_rule_type  (rule_type) UNIQUE
#
```

```yaml
# Table name: product_promotions
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint           not null
#  promotion_rule_id :bigint           not null
#
# Indexes
#
#  index_product_promotions_on_product_id                        (product_id)
#  index_product_promotions_on_product_id_and_promotion_rule_id  (product_id,promotion_rule_id) UNIQUE
#  index_product_promotions_on_promotion_rule_id                 (promotion_rule_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (promotion_rule_id => promotion_rules.id)
#
```

---

### README [frontend/README.md](frontend/README.md)

# React + TypeScript + Vite Frontend

Install dependencies

```
yarn install
```

Run dev server

```
yarn dev
```

Run build

```
yarn build
```

Run lint check

```
yarn lint
```

---

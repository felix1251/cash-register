require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  it 'Create product' do
    expect(product).to be_valid
    expect(product.name).to be_present
    expect(product.code).to be_present
    expect(product.base_price).to be_present
  end
end

# == Schema Information
#
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

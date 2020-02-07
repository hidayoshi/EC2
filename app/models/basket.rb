class Basket < ApplicationRecord
    USD_RATE = 110.freeze

    has_many :basket_products, dependent: :destroy
    has_many :products, through: :basket_products

    def total_price
        total_jpy_price + total_usd_price
    end

    def total_price(product_ids: nil)
        total_jpy_price(product_ids) + total_usd_price(product_ids)
    end

    private

    def total_jpy_price(product_ids)
        products = product_ids ? self.products.where(id: product_ids) : self.products
        jp_products = products.where(unit: 'yen')
        jp_products.sum(:price)
    end

    def total_usd_price(product_ids)
        products = product_ids ? self.products.where(id: product_ids) : self.products
        usd_products = products.where(unit: 'usd')
        usd_products.sum(:price) * USD_RATE
    end
end

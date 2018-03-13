class CostcoJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later

    Rails.logger.debug "#{self.class.name}: Start Fetch Price For Costco"

    agent = Mechanize.new
    page = agent.get('https://www.costco.com.tw/')
    #所有類別頁面
    all_type_page=[]
    all_type=page.search('a.show-sub-menu')
    all_type.each do |ap|
      unless all_type_page.include?(ap.values[0])
        Rails.logger.debug "#{self.class.name}: " + ap.text  + ap.values[0]
        all_type_page << ap.values[0]
      end
    end
    #產品頁面
    all_type_page.each do |atp|
      Rails.logger.debug "#{self.class.name}: " + 'https://www.costco.com.tw' +atp
      products_page = agent.get('https://www.costco.com.tw' + atp)
      products_data=products_page.search('li.product-item').search('div.product-info-wrapper')

      products_data.each do |product|
        product_price = product.search('span.notranslate')
        next if product_price.size==0
        product_name = product.search('a.js-lister-name').text
        Rails.logger.debug "#{self.class.name}: " + product_name + ' '+product_price[0]
      end

    end

  end
end

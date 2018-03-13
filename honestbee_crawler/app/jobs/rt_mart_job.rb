require 'rubygems'
require 'mechanize'

class RtMartJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later

    Rails.logger.debug "#{self.class.name}: Start Fetch Price For 大潤發"

    agent = Mechanize.new
    page = agent.get('http://www.rt-mart.com.tw/direct/')
    #所有類別頁面
    all_type_page=[]
    all_type=page.search('div.sub_nav').search('h4').search('a')
    all_type.each do |ap|
      unless all_type_page.include?(ap.values[0])
        all_type_page << ap.values[0]
      end
    end

    all_type_page.each do |atp|
      products_page = agent.get('http://www.rt-mart.com.tw/direct/' + atp)
      list_num=products_page.search('li.list_num').search('a')
      #Rails.logger.debug "#{self.class.name}: " + list_num.first.values[0]

      sub_type_page=[]
      #第一頁
      sub_type_page << atp
      #其它頁
      list_num.each do |products_page_num|
        unless sub_type_page.include?(products_page_num.values[0])
          sub_type_page << products_page_num.values[0]
        end
      end

      sub_type_page.each do |page_num|
        Rails.logger.debug "#{self.class.name}: " + page_num
        products_page = agent.get('http://www.rt-mart.com.tw/direct/' + page_num)
        products_data=products_page.search('div.indexProList')
        products_data.each do |product|
          Rails.logger.debug "#{self.class.name}: " + product.children[1].children[1].children[0]['title'] + ' ' + product.children[7].children[0].children[1].text
        end
      end
    end

  end
end

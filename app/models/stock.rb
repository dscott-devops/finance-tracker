class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  validates :name, :ticker, presence: true

  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex[:publishable_token],
            secret_token: Rails.application.credentials.iex[:secret_token],
            endpoint: 'https://sandbox.iexapis.com/v1' )
    begin
      logo = client.logo(ticker)
     new(ticker: ticker, name: client.company(ticker).company_name,
     last_price: client.price(ticker), logo: logo.url)

    rescue => exception
     return nil
    end
  end

  def self.check_db(ticker)
    where(ticker: ticker).first
  end
end

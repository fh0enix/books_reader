require "factory_bot_rails"

Chewy.strategy(:atomic) do
  FactoryBot.create_list(:book, 50)
  FactoryBot.create_list(:user, 5)
end

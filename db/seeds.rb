require "factory_bot_rails"

Chewy.strategy(:bypass) do
  FactoryBot.create_list(:book, 50)
  FactoryBot.create_list(:user, 5)
end

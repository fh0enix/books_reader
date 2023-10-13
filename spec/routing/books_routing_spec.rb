# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/books').to(action: :index) }
    it { should route(:get, '/books/new').to(action: :new) }
    it { should route(:get, '/books/1').to(action: :show, id: 1) }
    it { should route(:get, '/books/1/edit').to(action: :edit, id: 1) }
    it { should route(:post, '/books').to(action: :create) }
    it { should route(:put, '/books/1').to(action: :update, id: 1) }
    it { should route(:patch, '/books/1').to(action: :update, id: 1) }
    it { should route(:delete, '/books/1').to(action: :destroy, id: 1) }
  end
end

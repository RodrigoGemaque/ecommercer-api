require 'rails_helper'
RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive}

  it { is_expected.to have_many(:product_categories).dependent(:destroy) }
  it { is_expected.to have_many(:products).through(:product_categories ) }


  #pegango o searchable concern de shared_examples
  it_behaves_like "name searchable concern", :category
  #pegango o paginatable concern de shared_examples
  it_behaves_like "paginatable concern", :category

end
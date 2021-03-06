require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) } 
  

  # before { puts "#{subject.price} and #{subject.productable}"}

  # before { puts "#{subject.price} and #{subject.productable.id}"}

  it { is_expected.to validate_uniqueness_of(:name).case_insensitive}
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:featured) }

  it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  it { is_expected.to belong_to :productable }
  

  it { is_expected.to have_many(:product_categories).dependent(:destroy) }
  it { is_expected.to have_many(:categories).through(:product_categories ) }



  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:status)}
  it {is_expected.to define_enum_for(:status).with_values({available: 1, unavailable: 2}  )}
  

  #pegango o searchable concern de shared_examples
  
  it_behavior_of "like searchable concern", :product, :name
  #pegango o paginatable concern de shared_examples
  it_behaves_like "paginatable concern", :product 

  it "creates as unfeatured by default" do
    subject.featured = nil
    subject.save(validate: false)
    expect(subject.featured).to be_falsey  
  end
  
end


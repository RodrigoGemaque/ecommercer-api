shared_examples "pagination meta attributes" do |pagination_attr|
  it "returns :meta attribute with right pagination data" do
    pagination_attr.stringify_keys!#transforma as chaves json em string
    p pagination_attr
    expect(body_json['meta']).to include(pagination_attr)
  end
end
class ConstructionPart
  include DataMapper::Resource

  property :id, Serial

  belongs_to :part
  belongs_to :construction
end

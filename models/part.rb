class Part

  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :required => true


  belongs_to :construction
  belongs_to :part, required: false
  has n, :parts, 'Part'

end

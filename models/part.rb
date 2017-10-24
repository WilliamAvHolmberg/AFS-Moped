class Part

  class Link

    include DataMapper::Resource

    storage_names[:default] = 'people_links'

    # the person who is following someone
    belongs_to :parent_part, 'Part', :key => true

    # the person who is followed by someone
    belongs_to :child_part, 'Part', :key => true

  end

  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :required => true


  has n, :construction_parts
  has n, :constructions, :through => :construction_parts
  # If we want to know all the people that John follows, we need to look
  # at every 'Link' where John is a :follower. Knowing these, we know all
  # the people that are :followed by John.
  #
  # If we want to know all the people that follow Jane, we need to look
  # at every 'Link' where Jane is :followed. Knowing these, we know all
  # the people that are a :follower of Jane.
  #
  # This means that we need to establish two different relationships to
  # the 'Link' model. One where the person's role is :follower and one
  # where the person's role is to be :followed by someone.

  # In this relationship, the person is the follower
  has n, :links_to_child_parts, 'Part::Link', :child_key => [:parent_part_id]

  # In this relationship, the person is the one followed by someone
  has n, :links_to_parent_parts, 'Part::Link', :child_key => [:child_part_id]


  # We can then use these two relationships to relate any person to
  # either the people followed by the person, or to the people this
  # person follows.

  # Every 'Link' where John is a :follower points to a person that
  # is followed by John.
  has n, :parent_parts, self,
    :through => :links_to_parent_parts, # The person is a follower
    :via     => :parent_part

  # Every 'Link' where Jane is :followed points to a person that
  # is one of Jane's followers.
  has n, :child_parts, self,
    :through => :links_to_child_parts, # The person is followed by someone
    :via     => :child_part

  # Follow one or more other people
  def link(child_parts)
    parent_parts.concat(Array(child_parts))
    save
    self
  end

  # Unfollow one or more other people
  def unfollow(child_parts)
    parent_parts.all(:followed => Array(child_parts)).destroy!
    reload
    self
  end
 

end

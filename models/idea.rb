class Idea < ActiveRecord::Base
  before_create do |idea|
    idea.uuid = idea.generate_uuid
  end

  def as_json(options={})
    {
      id: self.uuid,
      created_at: self.created_at,
      title: self.title,
      body: self.body,
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def generate_uuid
    loop do
      uuid = UUID.new.generate
      break uuid unless Idea.exists?(uuid: uuid)
    end
  end
end

module Resources
  class Schema
    include JsonWorld::DSL

    schema "http://json-schema.org/draft-04/hyper-schema"
    property(:sake, links: true, type: Resources::Sake)
    property(:user, links: true, type: Resources::User)
    property(:checkin, links: true, type: Resources::Checkin)
    property(:place, links: true, type: Resources::Place)
  end
end

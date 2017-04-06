module Resources
  class Checkin < Base
    title 'User'
    link(
      :add,
      description: "チェックインを行います。",
      method: :post,
      path: "/checkins/add",
      rel: "create",
    )
  end
end
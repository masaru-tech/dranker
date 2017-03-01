module Resources
  class User < Base

    title 'User'
    link(
      :create_user,
      description: "新規の匿名ユーザを作成します。",
      method: :post,
      path: "/users",
      rel: "create",
      parameters: {
        display_name: {
          example: 'ユーザ名',
          type: String,
        },
      }
    )
  end
end
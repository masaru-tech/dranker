module Resources
  class Sake < Base

    title 'Sake'
    property(
      :id,
      description: '日本酒のid',
      example: 1,
      type: Integer
    )

    property(
      :name,
      description: '日本酒の名前',
      example: "獺祭 純米大吟醸 磨き二割三分 遠心分離",
      type: String
    )

    property(
      :yomi,
      description: '日本酒の読み',
      example: "ダッサイ ジュンマイダイギンジョウ ミガキニワリサンフン エンシンブンリ",
      type: String
    )

    property(
      :kuramoto,
      description: '日本酒の蔵元名',
      example: "旭酒造",
      type: String
    )

    property(
      :locality,
      description: '蔵元の都道府県',
      example: "山口県",
      type: String
    )

    property(
      :raw_rice,
      description: '日本酒の原料米',
      example: "山田錦、日本晴",
      optional: true,
      type: String
    )

    property(
      :cleaning_rate,
      description: '日本酒の精米歩合',
      example: "23%",
      optional: true,
      type: String
    )

    property(
      :nihonsyu_degree,
      description: '日本酒度',
      example: "+5",
      optional: true,
      type: String
    )

    property(
      :amino_degree,
      description: 'アミノ酸度',
      example: 1.2,
      optional: true,
      type: "number"
    )

    property(
      :alcohol_content,
      description: 'アルコール度数',
      example: "16〜17%",
      optional: true,
      type: String
    )

    property(
      :acidit,
      description: '酸度',
      example: 1.3,
      optional: true,
      type: "number"
    )

    property(
      :use_yeast,
      description: '使用酵母',
      example: "岩手吟醸2号",
      optional: true,
      type: String
    )

    property(
      :tags,
      description: '日本酒の種類',
      example: ["生酒", "純米大吟醸"],
      optional: true,
      type: Array
    )

    link(
      :list_sakes,
      description: "全ての日本酒の一覧を取得します。",
      path: "/sakes",
      rel: "instances",
      parameters: {
        page: {
          example: 2,
          optional: true,
          type: String,
          pattern: /^[0-9]+$/
        },
        per_page: {
          example: 20,
          optional: true,
          type: String,
          pattern: /^[0-9]+$/
        }
      }
    )

    link(
      :get,
      description: "日本酒の詳細を取得します。",
      path: "/sakes/{sake_id}",
      rel: "self"
    )

    delegate(
      :id,
      :name,
      :yomi,
      to: :model
    )

    def tags
      model.tag_list
    end

    def method_missing(name, *arguments)
      case
      when model.sake_info.respond_to?(name)
        model.sake_info.__send__ name, *arguments
      else
        super
      end
    end
  end
end

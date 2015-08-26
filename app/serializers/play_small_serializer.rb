class PlaySmallSerializer < ActiveModel::Serializer
  attributes :id, :kills, :deaths, :assists, :kda, :champion_id, :end_level,
             :total_gold, :minions_killed, :first_spell, :second_spell,
             :item0, :item1, :item2, :item3, :item4, :item5
end

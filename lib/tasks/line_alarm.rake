namespace :line_alarm do
  desc "LINE通知メッセージ送信"
  task send_line_alarm: :environment do
    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end

    current_hour_jst = Time.current.hour

    users_to_alarm = User.where("EXTRACT(HOUR FROM alarm_time AT TIME ZONE 'JST') = ?", current_hour_jst)
    users_to_alarm.each do |user|
      next unless user.uid # user.uidがnilや空の場合は次のループへ

      message = {
        type: 'text',
        text: "学習の時間です。\n今日も一緒に頑張りましょう!\n(通知を止めたい場合は、「通知設定」より設定解除してください)\n\nhttps://rubyalgo.com"
      }
      response = client.push_message(user.uid, message)
      p response
    end
  end
end

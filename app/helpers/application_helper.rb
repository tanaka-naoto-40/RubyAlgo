module ApplicationHelper
  def icon(icon_name)
    tag.i(class: ["bi", "bi-#{icon_name}"])
  end
  
  def icon_with_text(icon_name, text)
    tag.span(icon(icon_name), class: "me-2") + tag.span(text)
  end

  def turbo_stream_flash
    turbo_stream.append "flashes", partial: "flash"
  end

    def default_meta_tags
      {
        site: 'RubyAlgo',
        title: '環境構築不要でRubyを学習できるサービス',
        reverse: true,
        charset: 'utf-8',
        description: 'RubyAlgoを使い、Rubyの学習を行いましょう。',
        keywords: 'Ruby, Ruby on Rails',
        canonical: request.original_url,
        separator: '|',
        icon: [
          { href: image_url('favicon.ico') },
        ],
        og: {
          site_name: :site,
          title: :title,
          description: :description,
          type: 'website',
          url: request.original_url,
          image: image_url('ogp.png'),
          local: 'ja-JP'
        },
        twitter: {
          card: 'summary_large_image',
          image: image_url('ogp.png')
        }
      }
    end

end

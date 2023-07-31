module ApplicationHelper
  def default_meta_tags
    {
      site: 'CREDO QUEST',
      title: '学習カリキュラムとともに、WEB業界カルチャーを身につけるTodoList',
      reverse: true,
      charset: 'utf-8',
      description: 'エンジニア学習の意識するコツがわかる、行動を共有しあえるアプリです。',
      keywords: 'エンジニア学習,エンジニア転職,未経験エンジニア',
      canonical: url_for(controller: 'users', action: 'index'),
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: url_for(controller: 'users', action: 'index'),
        image: image_url('ogp.jpg'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@CREDO_QUEST',
        image: image_url('ogp.jpg')
      }
    }
  end
end

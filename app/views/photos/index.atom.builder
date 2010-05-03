atom_feed do |feed|
  feed.title("Levent Ali Portrait Photography")
  feed.updated(@photos.first.created_at)

  for photo in @photos
    feed.entry(photo) do |entry|
      entry.title(photo.title)
      entry.content(image_tag(photo.url, :title => photo.title, :alt => photo.title), :type => 'html')

      entry.author do |author|
        author.name("Levent Ali")
      end
    end
  end
end
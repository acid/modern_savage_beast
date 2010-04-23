module TopicsHelper

  def js_for_monitor
    script = "if (this.checked) {
                #{remote_function :url => forum_topic_monitorship_path(@forum, @topic)}
              } else {
                #{remote_function :url => forum_topic_monitorship_path(@forum, @topic), :method => :delete}
              }"
  end

end
